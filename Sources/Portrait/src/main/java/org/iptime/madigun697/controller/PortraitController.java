package org.iptime.madigun697.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.apache.commons.imaging.ImageReadException;
import org.apache.commons.imaging.ImageWriteException;
import org.apache.commons.imaging.Imaging;
import org.apache.commons.imaging.common.IImageMetadata;
import org.apache.commons.imaging.formats.jpeg.JpegImageMetadata;
import org.apache.commons.imaging.formats.jpeg.exif.ExifRewriter;
import org.apache.commons.imaging.formats.tiff.TiffImageMetadata;
import org.apache.commons.imaging.formats.tiff.write.TiffOutputSet;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPatch;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.iptime.madigun697.service.AlbumService;
import org.iptime.madigun697.service.EventService;
import org.iptime.madigun697.service.GPSLogService;
import org.iptime.madigun697.service.PeopleService;
import org.iptime.madigun697.service.PhotoService;
import org.iptime.madigun697.service.PublishService;
import org.iptime.madigun697.service.TagService;
import org.iptime.madigun697.service.UserService;
import org.iptime.madigun697.util.albumNameCompare;
import org.iptime.madigun697.util.dateAscCompare;
import org.iptime.madigun697.util.geoAscCompare;
import org.iptime.madigun697.vo.Album;
import org.iptime.madigun697.vo.Event;
import org.iptime.madigun697.vo.GPSLog;
import org.iptime.madigun697.vo.People;
import org.iptime.madigun697.vo.PeopleCnt;
import org.iptime.madigun697.vo.Photo;
import org.iptime.madigun697.vo.Publish;
import org.iptime.madigun697.vo.Search;
import org.iptime.madigun697.vo.Tag;
import org.iptime.madigun697.vo.User;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGDecodeParam;
import com.sun.image.codec.jpeg.JPEGImageDecoder;

@Controller
public class PortraitController {

	@Autowired
	private UserService userService;

	@Autowired
	private PhotoService photoService;

	@Autowired
	private AlbumService albumService;

	@Autowired
	private TagService tagService;

	@Autowired
	private PeopleService peopleService;

	@Autowired
	private EventService eventService;

	@Autowired
	private PublishService publishService;
	
	@Autowired
	private GPSLogService gpsLogService;

	private static final long serialVersionUID = 1L;
	private static final String CLIENT_ID = "376770627633-alfd7mapmlif4s8i1aoca4l1a0l6jijr.apps.googleusercontent.com";
	private static final String CLIENT_SECRET = ""; // Client Secret
	private static final String CALLBACK_URI = "http://madigun697.iptime.org/Portrait/hello.do";

	private static final String USER_INFO_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
	private static final String PHOTO_INFO_URL = "https://picasaweb.google.com/data/feed/api/user/";
	private static final String TOKEN_URI = "https://accounts.google.com/o/oauth2/token";
	private static final String PHOTO_UPDATE_URL = "https://picasaweb.google.com/data/entry/api/user/";

	private static final String saveThumnailDirectory = "/thumnail";
	private static final int maxPostSize = 10 * 1024 * 1024;
	private static final int maxWidth = 2048;
	private static final int maxHeight = 2048;
	private final String boundary = "END_OF_PART";

	private Map<String, List<Photo>> sortList = new HashMap<String, List<Photo>>();

	@RequestMapping(value = "index.do")
	public String index(Model m) {
		m.addAttribute("content", "mainUi.jsp");
		return "index";
	}

	@RequestMapping(value = "home.do")
	public String home(Model m) {
		m.addAttribute("content", "mainUi.jsp");
		return "index";
	}

	@RequestMapping(value = "login.do")
	public String login(Model m) {
		m.addAttribute("content", "login.jsp");
		return "index";
	}

	@RequestMapping(value = "timeLinePage.do")
	public String timeLinePage(HttpServletRequest request, HttpSession session,
			Model m) {
		try {
			String userId = (String) session.getAttribute("userId");

			// userId로 user의 정보를 가져오는 함수
			User user = userService.getUserInfo(userId);

			// userId 로 event 정보를 가져오는 함수
			List<Event> eventList = eventService.getEventList(userId);
			
			
			

			// 각 eventId를 가진 사진들을 1개를 불러오는 함수
			for (Event e : eventList) {
				String photoUrl = eventService.getPhotoUrl(e.getEventId());
				e.setPhotoUrl(photoUrl);
				//만약에 PhotoUrl 이 없다면(사진이 없다면) 해당 이벤트를 삭제
				
				/*if(null==photoUrl){
					eventList.remove(e);
				}*/
			}

			request.setAttribute("user", user);
			request.setAttribute("eventList", eventList);
			m.addAttribute("content", "timeLine.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping(value = "peopleView.do")
	public String peopleView(HttpSession session, Model m) {
		try {
			String userId = (String) session.getAttribute("userId");
			Map<String, Integer> peopleCount = peopleService.getPeopleCount(userId);
			Set<String> keySet = peopleCount.keySet();
			List<PeopleCnt> peopleCntList = new ArrayList<PeopleCnt>();
			;

			for (String key : keySet) {
				int size = peopleCount.get(key);
				 System.out.println(size);
				peopleCntList.add(new PeopleCnt(key, size, photoService
						.getPhotoUrl(key, userId)));
			}
			 System.out.println("here");
			List<Integer> cntList = peopleService.getCntList(userId);
			 System.out.println("3: " + cntList);

			m.addAttribute("cntList", cntList);
			m.addAttribute("peopleCntList", peopleCntList);
			m.addAttribute("content", "peopleView.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping(value = "PeoplePhotoView.do")
	public String peoplePhotoView(HttpServletRequest request,
			HttpSession session, Model m) {
		try {
			String userId = (String) session.getAttribute("userId");
			String peopleName = request.getParameter("peopleName");
			// System.out.println(peopleName);
			People people = new People();
			people.setPeopleName(peopleName);
			people.setUserId(userId);

			List<Photo> photoList = photoService.getPeoplePhotoList(people);

			for (Photo photo2 : photoList) {
				List<Tag> temp_tag = tagService
						.getTags(photo2.getPhotoId(), userId);
				List<People> temp_people = peopleService.getPeople(
						photo2.getPhotoId(), userId);

				photo2.setTags(temp_tag);
				photo2.setPeople(temp_people);

				String tagText = temp_tag.toString();
				String peopleText = temp_people.toString();

				photo2.setTagText(tagText.substring(1, tagText.length() - 1));
				photo2.setPeopleText(peopleText.substring(1,
						peopleText.length() - 1));

				if (photo2.getTime() != null) {
					String pattern = "YYYY-MM-dd (a) HH:mm:ss";
			        photo2.setTime(convertTimestamp(Long.parseLong(photo2.getTime()), pattern));
			     }

			}

			List<Tag> tagList = tagService.getTagList(userId);
			StringBuffer _tagList = new StringBuffer();
			for (int i = 0; i < tagList.size(); i++) {
				if (i == tagList.size() - 1) {
					_tagList.append(tagList.get(i));
				} else {
					_tagList.append(tagList.get(i));
					_tagList.append(",");
				}
			}

			List<User> peopleList = userService.getUserList();
			StringBuffer _peopleList = new StringBuffer();
			for (int i = 0; i < peopleList.size(); i++) {
				if (i == peopleList.size() - 1) {
					_peopleList.append(peopleList.get(i));
				} else {
					_peopleList.append(peopleList.get(i));
					_peopleList.append(",");
				}
			}

			request.setAttribute("tagList", _tagList.toString());
			request.setAttribute("peopleList", _peopleList.toString());
			request.setAttribute("photoList", photoList);

			m.addAttribute("content", "photoList.jsp");
		} catch (NumberFormatException e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	/* location 주변 사진 받아오는 기능 */
	@RequestMapping(value = "locationPhotoView.do")
	@ResponseBody
	private String locationPhotoView(@RequestParam("lat123") String lat,
			@RequestParam("lng123") String lng, @RequestParam("photoId") String photoId, String boundary,
			HttpSession session, Model m) {

		String responseData=null;
		try {
			//System.out.println(photoId);
			ObjectMapper om = new ObjectMapper();
			String userId = (String) session.getAttribute("userId");
			Photo photo = new Photo();
			photo.setUserId(userId);
			System.out.println(photoId+""+userId);
			List<Photo> listData = photoService.getNearByPhotos(photoId, userId);
			responseData = om.writeValueAsString(listData);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		} 

		return responseData;
	}

	/* 마커를 클릭했을 때 사진이 커지는 기능 */
	@RequestMapping(value = "changeLocationView.do")
	@ResponseBody
	public String changeLocationView(@RequestParam("photoId") String photoId, Model m)
			{

		String responseData=null;
		try {
			ObjectMapper om = new ObjectMapper();

			Photo photoInfo = photoService.getPhoto(photoId);
			responseData = om.writeValueAsString(photoInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
		return responseData;
	}

	/* 리스트에서 리스트 선택 시 선택된 사진 주변을 가져오는 기능 */
	@RequestMapping(value = "changeLocationPhotoView.do")
	@ResponseBody
	public String changeLocationPhotoView(
			@RequestParam("photoId") String photoId, HttpSession session, Model m)
			throws Exception {

		String responseData=null;
		try {
			String userId = (String) session.getAttribute("userId");

			List<Photo> listData = photoService.getNearByPhotos(photoId, userId);
			
			ObjectMapper om = new ObjectMapper();
			responseData = om.writeValueAsString(listData);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
		return responseData;
	}

	/* 지도에 마커 찍는 기능 */
	@RequestMapping(value = "locationView.do")
	public String locationView(HttpSession session, Model m) {
		try {
			String userId = (String) session.getAttribute("userId");
			System.out.println(userId);
			Photo photo = new Photo();
			photo.setUserId(userId);

			List<Photo> photoList = photoService.getPhotoList(photo);
			List<Photo> outList = new ArrayList<Photo>();
			System.out.println(photoList);
			for (Photo photo2 : photoList) {
				if (photo2.getGeoTag() != null) {
					String[] geoArr = photo2.getGeoTag().split(" ");
					photo2.setGeoTag(geoArr[0] + "," + geoArr[1]);
				} else {
					outList.add(photo2);
				}
			}

			m.addAttribute("photoList", photoList);
			m.addAttribute("content", "locationView.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}
	
	/* 검색 페이지(search.jsp)를 불러오는 기능 */
	@RequestMapping(value = "searchView.do")
	public String searchView(HttpServletRequest request, HttpSession session,
			Model m) throws Exception {

		try {
			String userId = (String) session.getAttribute("userId");
			Photo photo = new Photo();
			photo.setUserId(userId);

			List<Photo> photoList = photoService.getPhotoList(photo);

			for (Photo photo2 : photoList) {
				List<Tag> temp_tag = tagService
						.getTags(photo2.getPhotoId(), userId);
				List<People> temp_people = peopleService.getPeople(
						photo2.getPhotoId(), userId);

				photo2.setTags(temp_tag);
				photo2.setPeople(temp_people);

				String tagText = temp_tag.toString();
				String peopleText = temp_people.toString();

				photo2.setTagText(tagText.substring(1, tagText.length() - 1));
				photo2.setPeopleText(peopleText.substring(1,
						peopleText.length() - 1));

				if (photo2.getTime() != null) {
					String pattern = "YYYY-MM-dd (a) HH:mm:ss";
			        photo2.setTime(convertTimestamp(Long.parseLong(photo2.getTime()), pattern));
			     }

			}

			List<Tag> tagList = tagService.getTagList(userId);
			StringBuffer _tagList = new StringBuffer();
			for (int i = 0; i < tagList.size(); i++) {
				if (i == tagList.size() - 1) {
					_tagList.append(tagList.get(i));
				} else {
					_tagList.append(tagList.get(i));
					_tagList.append(",");
				}
			}

			List<User> peopleList = userService.getUserList();
			StringBuffer _peopleList = new StringBuffer();
			for (int i = 0; i < peopleList.size(); i++) {
				if (i == peopleList.size() - 1) {
					_peopleList.append(peopleList.get(i));
				} else {
					_peopleList.append(peopleList.get(i));
					_peopleList.append(",");
				}
			}

			Map<String, Integer> peopleCount = peopleService.getPeopleCount(userId);
			Set<String> keySet = peopleCount.keySet();
			List<PeopleCnt> peopleCntList = new ArrayList<PeopleCnt>();

			for (String key : keySet) {
				int size = peopleCount.get(key);
				peopleCntList.add(new PeopleCnt(key, size, photoService
						.getPhotoUrl(key, userId)));
			}
			
			sortList = photoService.sortByGeotag(userId, 500);

			Set<String> keySet2 = sortList.keySet();
			List<String> keyList = new ArrayList<String>();
			keyList.addAll(keySet2);

			for (String key : keyList) {
				System.out.println("key: " + key);
				if (key.contains(",")) {
					List<Photo> _list = sortList.get(key);
					sortList.remove(key);
					String _key = key.replace(",", "_");
					sortList.put(_key, _list);
				}
			}
			
			keyList.clear();
			keyList.addAll(sortList.keySet());
			
			Collections.sort(keyList, new geoAscCompare());
			
			m.addAttribute("keySet", keyList);

			List<Integer> cntList = peopleService.getCntList(userId);
			m.addAttribute("cntList", cntList);
			m.addAttribute("peopleCntList", peopleCntList);

			request.setAttribute("tagList", _tagList.toString());
			request.setAttribute("tagListArr", tagList);
			request.setAttribute("peopleList", _peopleList.toString());
			request.setAttribute("photoList", photoList);
			request.setAttribute("content", "searchView.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}

		return "index";
	}

	/* 검색 페이지에서 인물 비동기 검색 기능 */
	@RequestMapping(value = "searchPeopleList.do" ,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String searchPeopleList(@RequestParam("peopleName") String name,
			HttpSession session, Model m) throws Exception {
		String nameList=null;
		try {
			String userId = (String) session.getAttribute("userId");

			Map<String, Integer> peopleCount = peopleService.getPeopleCount(userId);
			Set<String> keySet = peopleCount.keySet();

			List<PeopleCnt> peopleCntList = new ArrayList<PeopleCnt>();

			for (String key : keySet) {
				int size = peopleCount.get(key);
				peopleCntList.add(new PeopleCnt(key, size, photoService
						.getPhotoUrl(key, userId)));
			}

			ArrayList<PeopleCnt> searchPeopleByName = new ArrayList<PeopleCnt>();

			for (int i = 0; peopleCntList.size() > i; i++) {
				if ((peopleCntList.get(i).getPeopleName()).contains(name)) {
					searchPeopleByName.add(peopleCntList.get(i));
				
				}
			}

			//return searchPeopleByName;
			ObjectMapper om = new ObjectMapper();
			
			nameList = om.writeValueAsString(searchPeopleByName);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
		return nameList;
	}
	
	/* 검색 페이지에서 태그 비동기 검색 기능 */
	@RequestMapping(value="searchTagList.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String searchTagList(@RequestParam("tagName") String tagName,
			HttpSession session, Model m) throws JsonGenerationException, JsonMappingException, IOException{
		
		String StringTagList=null;
		try {
			String userId = (String) session.getAttribute("userId");
			
			List<Tag> tagList = tagService.getTagList(userId);
			StringBuffer _tagList = new StringBuffer();
			for (int i = 0; i < tagList.size(); i++) {
				if (i == tagList.size() - 1) {
					_tagList.append(tagList.get(i));
				} else {
					_tagList.append(tagList.get(i));
					_tagList.append(",");
				}
			}

			List<Tag> tagSearchList = new ArrayList<Tag>();
			
			for(int i=0; i<tagList.size(); i++){
				if(tagList.get(i).getTagName().contains(tagName)){
					tagSearchList.add(tagList.get(i));
				}
			}
			ObjectMapper om = new ObjectMapper();
			StringTagList = om.writeValueAsString(tagSearchList);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
		return StringTagList;
	}
	
	/* 검색 페이지에서 장소 비동기 검색 기능 */
	@RequestMapping(value="searchLocationList.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String searchLocationList(@RequestParam("locationName") String locationName, String tagName,
			HttpSession session, Model m) throws Exception{
		String stringLocationList=null;
		try {
			String userId = (String) session.getAttribute("userId");
			
			sortList = photoService.sortByGeotag(userId, 500);

			Set<String> keySet2 = sortList.keySet();
			List<String> keyList = new ArrayList<String>();
			keyList.addAll(keySet2);

			Collections.sort(keyList, new geoAscCompare());
			String key = null;

			for (String string : keyList) {
				key = string;
				break;
			}
			
			String [] keyArr = null;
			List<String> _keyList = new ArrayList<String>(); 
			for(int i=0; i<keyList.size(); i++){
				keyArr = keyList.get(i).split(",");
				_keyList.addAll(Arrays.asList(keyArr));
			}
			
			List<String> locationSearchList = new ArrayList<String>(); 
			for(int i=0; i<_keyList.size(); i++){
				if(_keyList.get(i).contains(locationName)){
					locationSearchList.add(_keyList.get(i));
				}
			}
			ObjectMapper om = new ObjectMapper();
			stringLocationList = om.writeValueAsString(locationSearchList);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
		return stringLocationList;

	}

	@RequestMapping(value = "uploadPage.do")
	public String uploadPage(HttpServletRequest request, HttpSession session,
			Model m) {
		try {
			String userId = (String) session.getAttribute("userId");
			Photo photo = new Photo();
			photo.setUserId(userId);

			List<Photo> photoList = photoService.getPhotoList(photo);

			for (Photo photo2 : photoList) {
				List<Tag> temp_tag = tagService
						.getTags(photo2.getPhotoId(), userId);
				List<People> temp_people = peopleService.getPeople(
						photo2.getPhotoId(), userId);

				photo2.setTags(temp_tag);
				photo2.setPeople(temp_people);

				String tagText = temp_tag.toString();
				String peopleText = temp_people.toString();

				photo2.setTagText(tagText.substring(1, tagText.length() - 1));
				photo2.setPeopleText(peopleText.substring(1,
						peopleText.length() - 1));

				if (photo2.getTime() != null) {
					String pattern = "YYYY-MM-dd (a) HH:mm:ss";
			        photo2.setTime(convertTimestamp(Long.parseLong(photo2.getTime()), pattern));
			     }

			}

			List<Tag> tagList = tagService.getTagList(userId);
			StringBuffer _tagList = new StringBuffer();
			for (int i = 0; i < tagList.size(); i++) {
				if (i == tagList.size() - 1) {
					_tagList.append(tagList.get(i));
				} else {
					_tagList.append(tagList.get(i));
					_tagList.append(",");
				}
			}

			List<User> peopleList = userService.getUserList();
			StringBuffer _peopleList = new StringBuffer();
			for (int i = 0; i < peopleList.size(); i++) {
				if (i == peopleList.size() - 1) {
					_peopleList.append(peopleList.get(i));
				} else {
					_peopleList.append(peopleList.get(i));
					_peopleList.append(",");
				}
			}

			request.setAttribute("tagList", _tagList.toString());
			request.setAttribute("peopleList", _peopleList.toString());
			request.setAttribute("photoList", photoList);
			m.addAttribute("content", "upload.jsp");
		} catch (NumberFormatException e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping(value = "addAlbum.do")
	public String addAlbum(String albumTitle, HttpServletRequest request,
			HttpSession session, Model m) throws Exception {

		// 새로 입력된 앨범명의 존재 여부 확인 후 앨범 Id 호출
		String albumId=null;
		try {
			String access_token = (String) session.getAttribute("token");
			String userId = (String) session.getAttribute("userId");

			albumId = albumService.searchAlbumTitle(userId, albumTitle);

			// 새로운 앨범인 경우 앨범 생성
			boolean newAlbumFlag = false;
			if (albumId == null || albumId.trim().length() == 0) {
				albumId = createAlbum(albumTitle, userId, "USER");
				newAlbumFlag = true;
			}

			String[] checks = request.getParameter("arrFir").split(",");
			List<String> _photoList = new ArrayList<String>(Arrays.asList(checks));

			for (String photoId : _photoList) {
				Photo updatePhoto = photoService.getPhoto(photoId);
				updatePhoto.setAlbumId(albumId);
				updatePhoto.setPhotoId(photoId);
				updatePhoto.setUserId(userId);
				photoService.updatePhoto(updatePhoto);
				update(updatePhoto, session, access_token);
			}

			if (newAlbumFlag) {
				albumService.updateAlbum(albumId);
				List<Album> albumList = albumService.getAlbumList(userId);
				Collections.sort(albumList, new albumNameCompare());
				session.setAttribute("albumList", albumList);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}

		return "redirect:albumView.do?albumId=" + albumId;
	}

	@RequestMapping(value = "albumDel.do")
	public String albumDel(String albumId, HttpSession session, Model m )
			throws Exception {
		try {
			Album album = new Album();
			String userId = (String) session.getAttribute("userId");
			String access_token = (String) session.getAttribute("token");

			// DB 업데이트
			album.setAlbumId(albumId);
			album.setUserId(userId);

			// albumId로 Photo List Get
			Photo _photo = new Photo();
			_photo.setUserId(userId);
			_photo.setAlbumId(albumId);
			List<Photo> photoList = photoService.getPhotoList(_photo);

			albumService.removeAlbum(album);

			// for 돌려가면서 picasa update
			for (Photo photo : photoList) {
				photo.setAlbumId(userId + "_recycle");
				update(photo, session, access_token);
			}

			List<Album> albumList = albumService.getAlbumList(userId);
			Collections.sort(albumList, new albumNameCompare());
			session.setAttribute("albumList", albumList);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}

		return "redirect:albumList.do";
	}

	/* 로그인 토큰 입력 시 앨범리스트 페이지로 이동 */
	@RequestMapping(value = "albumList.do")
	public String albumList(HttpServletRequest request, HttpSession session,
			Model m) {

		m.addAttribute("content", "albumList2.jsp");

		return "index";
	}

	/*
	 * 총 3가지의 경우의 수 존재 1. 아직 로그인하지 않은 경우(Authorization Code를 발급받기 위해 로그인 필요) -
	 * Interceptor로 처리 2. 로그인 절차 직후(Access Token의 발급이 필요) - needAccessToken 3.
	 * 로그인 상태(Access Token을 이용하여 사진 데이터를 로딩) - logined 해당 상태를 session에
	 * Attribute로 부여하여 분기 필요 로그인 상태에서 최종적으로 session에서 보유해야하는 값은 access token,
	 * userId, albumId, 보여줄 사진 목록
	 */
	@RequestMapping(value = "hello.do")
	public String hello(HttpServletRequest request, HttpSession session, Model m) {
		try {
			if (session.getAttribute("token") == null) {

				// authorization code를 token request로 전달하여 access token 취득
				String accessToken = request.getParameter("token");
				session.setAttribute("token", accessToken);

				// access token을 통해 userId 확인
				String userId = getUserId(accessToken);
				session.setAttribute("userId", userId);

				// 가입 여부 확인
				// albumId 획득
				String pAlbumId = userService.login(userId);
				boolean userCheck = pAlbumId == null ? true : false;

				if (userCheck) {
					// portrait album 생성 및 album id 획득
					pAlbumId = createPortraitAlbum(userId, accessToken);
					// 미분류 앨범 및 전체 앨범 생성 및 DB 저장
					// album id를 DB에 저장하여 추후 확인가능하도록 수정
					User user = new User();
					user.setUserId(userId);
					user.setUserName(getUserName(accessToken));
					user.setpAlbumId(pAlbumId);
					userService.registryUser(user);
					// 기본 앨범 생성
					albumService.createDefaultAlbum(userId);
				}

				session.setAttribute("pAlbumId", pAlbumId);

				// 전체 사진 동기화 작업
				syncPhotos(accessToken, userId, pAlbumId);

				// 앨범 목록 획득
				List<Album> albumList = albumService.getAlbumList(userId);
				Collections.sort(albumList, new albumNameCompare());

				///////////////////////////////난도질//////////////////////////////////////////////////////////////////////////

				/* userId 는 토큰값 들어온다. */
				// userId를 가지고 내게 전송된 사진이 있는지 앨범 아이디를 확인

				List<Publish> alertList = publishService.getPublishInfo(userId);
				

				session.setAttribute("alertList", alertList);
				// /////////////////////////////////////////////////////////////////////////////////////////////////////////

				session.setAttribute("albumList", albumList);
				m.addAttribute("content", "albumList2.jsp");
				// 주형 오빠가 만든 프로토타입 이동
				// m.addAttribute("content", "albumList.jsp");

				return "index";

			} else {

				m.addAttribute("content", "albumList2.jsp");

				return "index";
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			return "login";
		}
	}

	/*
	 * 앨범 내 사진 목록 출력
	 */
	@RequestMapping(value = "albumView.do")
	public String albumView(String albumId, HttpSession session,
			HttpServletRequest request, Model m) throws Exception {
		try {
			String userId = (String) session.getAttribute("userId");
			Photo photo = new Photo();
			photo.setUserId(userId);
			if (albumId.equals(userId + "_unsort")) {
				return "redirect:sortPhotos.do?type=geo&boundary=500";
			} else if (!albumId.equals(userId + "_all")) {
				photo.setAlbumId(albumId);
			}

			List<Photo> photoList = photoService.getPhotoList(photo);

			for (Photo photo2 : photoList) {
				List<Tag> temp_tag = tagService
						.getTags(photo2.getPhotoId(), userId);
				List<People> temp_people = peopleService.getPeople(
						photo2.getPhotoId(), userId);

				photo2.setTags(temp_tag);
				photo2.setPeople(temp_people);

				String tagText = temp_tag.toString();
				String peopleText = temp_people.toString();

				photo2.setTagText(tagText.substring(1, tagText.length() - 1));
				photo2.setPeopleText(peopleText.substring(1,
						peopleText.length() - 1));

				if (photo2.getTime() != null) {
					String pattern = "YYYY-MM-dd (a) HH:mm:ss";
			        photo2.setTime(convertTimestamp(Long.parseLong(photo2.getTime()), pattern));
			     }

			}

			List<Tag> tagList = tagService.getTagList(userId);
			StringBuffer _tagList = new StringBuffer();
			for (int i = 0; i < tagList.size(); i++) {
				if (i == tagList.size() - 1) {
					_tagList.append(tagList.get(i));
				} else {
					_tagList.append(tagList.get(i));
					_tagList.append(",");
				}
			}

			List<User> peopleList = userService.getUserList();
			StringBuffer _peopleList = new StringBuffer();
			for (int i = 0; i < peopleList.size(); i++) {
				if (i == peopleList.size() - 1) {
					_peopleList.append(peopleList.get(i));
				} else {
					_peopleList.append(peopleList.get(i));
					_peopleList.append(",");
				}
			}

			request.setAttribute("tagList", _tagList.toString());
			request.setAttribute("peopleList", _peopleList.toString());
			request.setAttribute("albumId", albumId);
			request.setAttribute("albumTitle", albumService.getAlbumTitle(albumId));
			request.setAttribute("photoList", photoList);

			// 주형 오빠가 만든 프로토타입 이동
			// m.addAttribute("content", "albumView.jsp");

			m.addAttribute("content", "mobilePhotoList.jsp");

			if (albumId.equals(userId + "_recycle")) {
				m.addAttribute("content", "recyclePhotoList.jsp");
			} else {
				m.addAttribute("content", "photoList.jsp");
			}
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		
		return "index";
	}

	@RequestMapping(value = "sortPhotos.do")
	private String sortPhotos(int boundary, String type,
			HttpServletRequest request, HttpSession session, Model m)
			{
		try {
			String userId = (String) session.getAttribute("userId");

			if (type.equals("geo")) {
				sortList = photoService.sortByGeotag(userId, boundary);
			} else {
				sortList = photoService.sortByDate(userId, boundary);
			}

			Set<String> keySet = sortList.keySet();
			List<String> keyList = new ArrayList<String>();
			keyList.addAll(keySet);

			if (type.equals("geo")) {
				Collections.sort(keyList, new geoAscCompare());
			} else {
				Collections.sort(keyList, new dateAscCompare());
			}

			for (String string : keyList) {
				System.out.println(string);
			}

			String key = null;

			for (String string : keyList) {
				key = string;
				break;
			}

			m.addAttribute("keySet", keyList);
			m.addAttribute("boundary", boundary);
			m.addAttribute("sortList", sortList.get(key));
			m.addAttribute("sortType", type);
			m.addAttribute("content", "sortPhotos.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping(value = "sortKeyPhotos.do")
	@ResponseBody
	private String sortKeyPhotos(String key, Model m)  {
		String sortJson=null;
		try {
			ObjectMapper om = new ObjectMapper();
			List<Photo> sort = sortList.get(key);
			sortJson = om.writeValueAsString(sort);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}

		return sortJson;
	}

	@RequestMapping(value = "recyclePhotos.do")
	private String recyclePhotos(HttpSession session, Model m) {
		try {
			String userId = (String) session.getAttribute("userId");
			Photo photo = new Photo();
			photo.setUserId(userId);
			photo.setAlbumId(userId + "_recycle");

			List<Photo> photoList = photoService.getPhotoList(photo);

			m.addAttribute("photoList", photoList);
			m.addAttribute("content", "recyclePhotoList.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping(value = "recoveryPhotos.do")
	private String recoveryPhotos(HttpSession session,
			HttpServletRequest request, Model m) throws Exception {
		// 새로 입력된 앨범명의 존재 여부 확인 후 앨범 Id 호출
		String albumId=null;
		try {
			String access_token = (String) session.getAttribute("token");
			String userId = (String) session.getAttribute("userId");

			albumId = userId + "_unsort";

			String[] checks = request.getParameter("arrFir2").split(",");
			List<String> _photoList = new ArrayList<String>(Arrays.asList(checks));

			for (String photoId : _photoList) {
				Photo updatePhoto = photoService.getPhoto(photoId);
				updatePhoto.setAlbumId(albumId);
				updatePhoto.setPhotoId(photoId);
				updatePhoto.setUserId(userId);
				photoService.updatePhoto(updatePhoto);
				update(updatePhoto, session, access_token);
			}

			List<Album> albumList = albumService.getAlbumList(userId);
			Collections.sort(albumList, new albumNameCompare());
			session.setAttribute("albumList", albumList);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}

		return "redirect:albumView.do?albumId=" + albumId;
	}

	/*
	 * 메인 페이지로 이동
	 */
	@RequestMapping(value = "main.do")
	public String main() {
		return "main";
	}

	/*
	 * 사진 업로드 기능
	 */
	@RequestMapping(value = "uploadMobile.do")
	public void uploadMobile(HttpServletRequest request) throws Exception {
		String access_token = request.getParameter("token");
		String userId = getUserId(access_token);
		String pAlbumId = userService.login(userId);
		
		System.out.println(access_token);
		System.out.println(userId);
		System.out.println(pAlbumId);
		
		uploadPhoto(request, userId, pAlbumId, access_token);
	}
	
	@RequestMapping(value = "upload.do")
	public String upload(HttpServletRequest request, HttpSession session, Model m) {
		// session에서 userId, albumId, access token을 획득
		String albumId=null;
		try {
			String userId = (String) session.getAttribute("userId");
			String pAlbumId = (String) session.getAttribute("pAlbumId");
			String access_token = (String) session.getAttribute("token");
			
			albumId = uploadPhoto(request, userId, pAlbumId, access_token);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}

		return "redirect:albumView.do?albumId=" + albumId;
	}
	
	private String uploadPhoto(HttpServletRequest request, String userId, String pAlbumId, String access_token) {
		String albumId = null;
		HttpServletRequest request1=null;
		try {
			// 사진을 보낼 url
			String upUrl = PHOTO_INFO_URL + userId + "/albumid/" + pAlbumId
					+ "?access_token=" + access_token;

			// MultipartRequest를 통해 form을 통해 파일 수신
			MultipartRequest mRequest;
			mRequest = new MultipartRequest(request, request
					.getServletContext().getRealPath(saveThumnailDirectory),
					maxPostSize, "UTF-8");

			Enumeration names = mRequest.getParameterNames();
			
			while(names.hasMoreElements()) {
				System.out.println(names.nextElement().toString());
			}
			
			
			// file 이름 확인
			String originalFileName = mRequest.getOriginalFileName("file");
			String _name = null;
			if (originalFileName == null) {
				Enumeration files = mRequest.getFileNames();
				if (files.hasMoreElements()) {
					_name = (String) files.nextElement();
					originalFileName = mRequest.getFilesystemName(_name);
				}
			}
			albumId = mRequest.getParameter("albumId");

			// 정상적인 file 저장 확인
			if (originalFileName == null) {
				System.out.println("fail");
			} else {
				/*
				 * metadata와 함께 file을 picasa album으로 전송
				 */
				HttpClient client = new DefaultHttpClient();
				HttpPost post = new HttpPost(upUrl);

				File file = mRequest.getFile("file");
				if (file == null) {
					file = mRequest.getFile(_name);
				}
				int width = 0;
				int height = 0;

				// upload된 image의 width와 height를 확인
				ImageInputStream in = ImageIO.createImageInputStream(file);
				try {
					final Iterator<ImageReader> readers = ImageIO
							.getImageReaders(in);
					if (readers.hasNext()) {
						ImageReader reader = readers.next();
						try {
							reader.setInput(in);
							width = reader.getWidth(0);
							height = reader.getHeight(0);
						} finally {
							reader.dispose();
						}
					}
				} finally {
					if (in != null)
						in.close();
				}

				String path = request.getServletContext().getRealPath(
						saveThumnailDirectory)
						+ "/" + originalFileName;

				// 원본 사진 백업
				String suffix = file.getName()
						.substring(file.getName().lastIndexOf('.') + 1)
						.toLowerCase();
				FileInputStream inputStream = new FileInputStream(path);
				String originPath = path.substring(0, path.length() - 4)
						+ "_origin." + suffix;
				FileOutputStream outputStream = new FileOutputStream(originPath);

				FileChannel fcin = inputStream.getChannel();
				FileChannel fcout = outputStream.getChannel();

				long size = fcin.size();
				fcin.transferTo(0, size, fcout);

				fcout.close();
				fcin.close();

				outputStream.close();
				inputStream.close();

				// image가 큰 경우 resize
				if (width >= maxWidth || height >= maxHeight) {

					JPEGImageDecoder decoder = JPEGCodec
							.createJPEGDecoder(new FileInputStream(file));
					BufferedImage image = decoder.decodeAsBufferedImage();

					JPEGDecodeParam decodeParam = decoder.getJPEGDecodeParam();

					File origin = new File(originPath);
					int[] resize = resize(file, path, width, height);

					writeExifData(origin, file, resize);
				}

				// picasa에 사진 전송
				post.addHeader(new BasicHeader("Content-Type",
						"multipart/related; boundary=" + boundary));
				post.addHeader(new BasicHeader("MIME-version", "1.0"));

				// 파일명 인코딩
				String encodede = URLEncoder.encode(originalFileName, "UTF-8");

				String metadata = "<entry xmlns='http://www.w3.org/2005/Atom'>"
						+ "<title>"
						+ encodede // 파
						+ "</title>"
						+ "<summary>"
						+ "</summary>"
						+ "<category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/photos/2007#photo'></category>"
						+ "</entry>";

				MultipartEntityBuilder meb = MultipartEntityBuilder.create();
				meb.setBoundary(boundary);
				meb.setMode(HttpMultipartMode.STRICT);
				meb.setCharset(Charset.forName("UTF-8"));

				meb.addTextBody("metadata", metadata, ContentType
						.create("application/atom+xml; charset=UTF-8"));
				meb.addBinaryBody("file", file, ContentType
						.create(URLConnection
								.guessContentTypeFromName(originalFileName)),
						originalFileName);

				post.setEntity(meb.build());
				HttpResponse resp = client.execute(post);

				// 생성 결과
				StringBuffer responseXml = new StringBuffer();
				InputStreamReader is = new InputStreamReader(resp.getEntity()
						.getContent(), "UTF-8");
				BufferedReader br = new BufferedReader(is);

				String line = "";
				while ((line = br.readLine()) != null) {
					responseXml.append(line);
				}
				System.out.println(responseXml.toString());

				// 업로드 완료 시 picasa에 사진 정보 추가
				JSONObject photoJSON = XML.toJSONObject(responseXml.toString())
						.getJSONObject("entry");
				Photo newPhoto = parseJSON(photoJSON, userId);
				// newPhoto.setAlbumId(albumId);
				newPhoto = photoService.newPhoto(newPhoto, userId);
				HttpSession session = request.getSession();
				update(newPhoto, session, access_token);
				photoService.updatePhoto(newPhoto);

			}
		} catch (Exception e) {
						
			e.printStackTrace();
			return "redirect:error.do";
		}
		
		return albumId;
	}

	/*
	 * 사진 업데이트 기능
	 */
	@RequestMapping(value = "update.do")
	public String updatePhoto(String photoId, String albumTitle,
			String oriAlbumId, String comments, String tags, String time,
			String people, HttpSession session)  {
		try {
			String access_token = (String) session.getAttribute("token");
			String userId = (String) session.getAttribute("userId");
			String albumId = null;
			HttpServletResponse response= null;
			
			// 사진 기존 정보 호출
			Photo updatePhoto = photoService.getPhoto(photoId);

			// 새로 입력된 앨범명의 존재 여부 확인 후 앨범 Id 호출
			albumId = albumService.searchAlbumTitle(userId, albumTitle);

			if (albumTitle == null || albumTitle.trim().length() == 0) {
				albumId = userId + "_unsort";
			}

			// 새로운 앨범인 경우 앨범 생성
			if (albumId == null || albumId.trim().length() == 0) {
				albumId = createAlbum(albumTitle, userId, "USER");
				albumService.updateAlbum(albumId);
			}

			// Tag DB에 추가
			String[] tagArr = tags.split(",");
			List<String> _tagList = new ArrayList<String>(Arrays.asList(tagArr));
			if (_tagList.get(0) == "" || _tagList.get(0) == null) {
				tagService.removeTag(userId, photoId);
			} else {
				List<Tag> tagList = new ArrayList<Tag>();
				tagService.removeTag(userId, photoId);
				for (String tagName : _tagList) {
					tagList.add(addTag(tagName, userId, photoId));
				}
				updatePhoto.setTags(tagList);
			}

			// People DB에 추가
			String[] peopleArr = people.split(",");
			List<String> _peopleList = new ArrayList<String>(
					Arrays.asList(peopleArr));

			if (_peopleList.get(0) == "" || _peopleList.get(0) == null) {
				peopleService.removePeople(photoId, userId);
			} else {
				List<People> peopleList = new ArrayList<People>();
				peopleService.removePeople(photoId, userId);
				for (String person : _peopleList) {
					peopleList.add(addPeople(person, photoId, userId));
				}
				updatePhoto.setPeople(peopleList);
			}

			// 업데이트 할 정보 추가
			updatePhoto.setAlbumId(albumId);
			updatePhoto.setDescription(comments);
			
			try {
				if (time != null && time.trim().length() != 0) {
					updatePhoto.setTime(makeTimestamp(time, ""));
				}

				// Picasa에 업데이트
				update(updatePhoto, session, access_token);
			} catch (Exception e) {
				return "redirect:hello.do";
				
			}

			// DB에 업데이트
			photoService.updatePhoto(updatePhoto);

			if (oriAlbumId.equals(userId + "_unsort") || oriAlbumId.equals(userId + "_all") || oriAlbumId.equals(userId + "_recycle")) {
				List<Album> albumList = albumService.getAlbumList(userId);
				Collections.sort(albumList, new albumNameCompare());
				session.setAttribute("albumList", albumList);

				return "redirect:albumView.do?albumId=" + oriAlbumId;
			} else {
				if (oriAlbumId.equals(albumId)) {
					return "redirect:albumView.do?albumId=" + albumId;
				} else {
					// 앨범이 바뀌는 경우 
					if (photoService.countPhoto(oriAlbumId) == 0) {
						albumService.emptyAlbum(oriAlbumId);
					} else if (albumService.CheckThumnail(updatePhoto.getPhotoUrl())) {
						albumService.updateAlbum(oriAlbumId);
					}
					
					if (photoService.countPhoto(albumId) == 1) {
						albumService.updateAlbum(albumId);
					}
					
					List<Album> albumList = albumService.getAlbumList(userId);
					Collections.sort(albumList, new albumNameCompare());
					session.setAttribute("albumList", albumList);

					return "redirect:albumView.do?albumId=" + oriAlbumId;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
	}
	
	@RequestMapping(value = "updateMulti.do")
	public String updateMulti(String albumTitle, String comments, String tags, String time,
			String people, HttpSession session, HttpServletRequest request) {
		try {
			String userId = (String) session.getAttribute("userId");
			String access_token = (String) session.getAttribute("token");
			
			String[] checks = request.getParameter("arrFir2").split(",");
			List<String> _photoList = new ArrayList<String>(Arrays.asList(checks));

			// 새로 입력된 앨범명의 존재 여부 확인 후 앨범 Id 호출
			String albumId = albumService.searchAlbumTitle(userId, albumTitle);

			// 새로운 앨범인 경우 앨범 생성
			if (albumId == null || albumId.trim().length() == 0) {

				if (albumTitle != null && albumTitle.trim().length() != 0) {
					albumId = createAlbum(albumTitle, userId, "USER");
					albumService.updateAlbum(albumId);
				}

			}
			
			for (String photoId : _photoList) {
				// 사진 기존 정보 호출
				Photo updatePhoto = photoService.getPhoto(photoId);
				String oriAlbumId = updatePhoto.getAlbumId(); 
				
				// Tag DB에 추가
				String[] tagArr = tags.split(",");
				List<String> _tagList = new ArrayList<String>(Arrays.asList(tagArr));
				if (_tagList.get(0) != "" && _tagList.get(0) != null) {
					List<Tag> tagList = updatePhoto.getTags();
					if (tagList == null) {
						tagList = new ArrayList<Tag>();
					}
					System.out.println(tagList);
					for (String tagName : _tagList) {
						tagList.add(addTag(tagName, userId, photoId));
					}
					updatePhoto.setTags(tagList);
				}

				// People DB에 추가
				String[] peopleArr = people.split(",");
				List<String> _peopleList = new ArrayList<String>(
						Arrays.asList(peopleArr));

				if (_peopleList.get(0) != "" && _peopleList.get(0) != null) {
					List<People> peopleList = updatePhoto.getPeople();
					if (peopleList == null) {
						peopleList = new ArrayList<People>();
					}
					for (String person : _peopleList) {
						peopleList.add(addPeople(person, photoId, userId));
					}
					updatePhoto.setPeople(peopleList);
				}

				// 업데이트 할 정보 추가
				if (albumId != null && albumId.trim().length() != 0) {
					updatePhoto.setAlbumId(albumId);
				}
				if (comments != null && comments.trim().length() != 0) {
					updatePhoto.setDescription(comments);
				}
				
				if (time != null && time.trim().length() != 0) {
					updatePhoto.setTime(makeTimestamp(time, ""));
				}

				// Picasa에 업데이트
				update(updatePhoto, session, access_token);

				// DB에 업데이트
				photoService.updatePhoto(updatePhoto);

				if (oriAlbumId.equals(userId + "_unsort") || oriAlbumId.equals(userId + "_all") || oriAlbumId.equals(userId + "_recycle")) {
					List<Album> albumList = albumService.getAlbumList(userId);
					Collections.sort(albumList, new albumNameCompare());
					session.setAttribute("albumList", albumList);

				} else {
					if (oriAlbumId.equals(albumId) || albumTitle == null || albumTitle.trim().length() == 0) {
					} else {
						// 앨범이 바뀌는 경우 
						if (photoService.countPhoto(oriAlbumId) == 0) {
							albumService.emptyAlbum(oriAlbumId);
						} else if (albumService.CheckThumnail(updatePhoto.getPhotoUrl())) {
							albumService.updateAlbum(oriAlbumId);
						}
						
						if (photoService.countPhoto(albumId) == 1) {
							albumService.updateAlbum(albumId);
						}
						
						List<Album> albumList = albumService.getAlbumList(userId);
						Collections.sort(albumList, new albumNameCompare());
						session.setAttribute("albumList", albumList);
			
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
		
		return "redirect:hello.do";
		
	}

	/*
	 * 사진 삭제 기능
	 */
	@RequestMapping(value = "delete.do")
	@ResponseBody
	public String delete(String albumId, String photoId, HttpSession session)
			{
		try {
			String userId = (String) session.getAttribute("userId");
			String pAlbumId = (String) session.getAttribute("pAlbumId");
			String access_token = (String) session.getAttribute("token");
			
			// 사진 기존 정보 호출
			Photo photo = photoService.getPhoto(photoId);

			// 사진 삭제 url           
			String deleteUrl = PHOTO_UPDATE_URL + userId + "/albumid/" + pAlbumId
					+ "/photoid/" + photoId + "?access_token=" + access_token;

			// System.out.println(deleteUrl);
			HttpClient client = new DefaultHttpClient();
			HttpDelete delete = new HttpDelete(deleteUrl);
			delete.addHeader(new BasicHeader("If-Match", "*"));

			client.execute(delete);

			// DB에서 사진 삭제
			if (photoService.countPhoto(albumId) == 1) {
				albumService.emptyAlbum(albumId);
			} else if (albumService.CheckThumnail(photo.getPhotoUrl())) {
				albumService.updateAlbum(albumId);
			}
			
			List<Album> albumList = albumService.getAlbumList(userId);
			Collections.sort(albumList, new albumNameCompare());
			session.setAttribute("albumList", albumList);
			
			tagService.removeTag(photoId, userId);
			peopleService.removePeople(photoId, userId);
			photoService.deletePhoto(photoId, userId);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		} 
		return albumId;
	}

	/*
	 * 사진 여러장 삭제 기능
	 */
	@RequestMapping(value = "deletePhotos.do")
	public String deletePhotos(String albumId, String photoId,
			HttpSession session, HttpServletRequest request, Model m)
			 {

		try {
			String[] checks = request.getParameter("arrFir2").split(",");
			int checkleng = checks.length;

			String userId = (String) session.getAttribute("userId");
			String pAlbumId = (String) session.getAttribute("pAlbumId");
			String access_token = (String) session.getAttribute("token");

			ArrayList<String> photoList = new ArrayList<String>();

			for (int i = 0; i < checkleng; i++) {
				photoList.add(checks[i]);
			}

			ArrayList<String> deleteUrlList = new ArrayList<String>();

			// 사진 삭제 url
			for (int i = 0; i < photoList.size(); i++) {
				deleteUrlList.add(PHOTO_UPDATE_URL + userId + "/albumid/"
						+ pAlbumId + "/photoid/" + photoList.get(i)
						+ "?access_token=" + access_token);
			}

			for (int i = 0; i < photoList.size(); i++) {

				// 사진 기존 정보 호출
				Photo photo = photoService.getPhoto(photoList.get(i));
				
				HttpClient client = new DefaultHttpClient();
				HttpDelete delete = new HttpDelete(deleteUrlList.get(i));
				delete.addHeader(new BasicHeader("If-Match", "*"));

				client.execute(delete);

				// DB에서 사진 삭제
				if (photoService.countPhoto(albumId) == 1) {
					albumService.emptyAlbum(albumId);
				} else if (albumService.CheckThumnail(photo.getPhotoUrl())) {
					albumService.updateAlbum(albumId);
				}
				
				List<Album> albumList = albumService.getAlbumList(userId);
				Collections.sort(albumList, new albumNameCompare());
				session.setAttribute("albumList", albumList);
				
				tagService.removeTag(photoList.get(i), userId);
				peopleService.removePeople(photoList.get(i), userId);
				photoService.deletePhoto(photoList.get(i), userId);
			}
		} catch (Exception e) {
			return "redirect:albumView.do?albumId=" + albumId;
		}
		return "redirect:albumView.do?albumId=" + albumId;

	}

	/* 이벤트 등록 */
	@RequestMapping(value = "addEvent.do")
	public String addEvent(HttpServletRequest request, HttpSession session,
			String eventName, String eventDate, String eventDesc, Model m) {

		try {
			String access_token = (String) session.getAttribute("token");
			String[] checks = request.getParameter("arrFir").split(",");
			String userId = (String) session.getAttribute("userId");
			ArrayList<String> photoIdList = new ArrayList<String>();

			int checklen = checks.length;

			for (int i = 0; i < checklen; i++) {
				photoIdList.add(checks[i]);

			}

			List<Photo> eventPhotoList = eventService.addEvent(userId,
					eventName, eventDate, photoIdList, eventDesc);

			for (Photo Photo : eventPhotoList) {
				if (Photo.getDescription() == null) {
					Photo.setDescription("");
				}
				update(Photo, session, access_token);
			}

			/* 이벤트 조회 메서드를 실행해서 timeLine 을 부른다! */

			// userId로 user의 정보를 가져오는 함수

			User user = userService.getUserInfo(userId);

			// userId 로 event 정보를 가져오는 함수
			List<Event> eventList = eventService.getEventList(userId);

			// 각 eventId를 가진 사진들을 1개를 불러오는 함수
			for (Event e : eventList) {
				String photoUrl = eventService.getPhotoUrl(e.getEventId());
				e.setPhotoUrl(photoUrl);
			}

			request.setAttribute("user", user);
			request.setAttribute("eventList", eventList);
			m.addAttribute("content", "timeLine.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}

		return "index";
	}

	/* 이벤트 선택 시 사진 조회 기능 */
	@RequestMapping(value = "EventView.do")
	public String EventView(HttpServletRequest request, HttpSession session,
			String eventId, Model m) {

		try {
			// eventId로 해당 사진 조회하는 기능
			List<Photo> eventPhotoList = eventService.findEventPhoto(eventId);

			// eventId 로 event 객체 가져오는 기능
			Event event = eventService.searchEvent(eventId);

			request.setAttribute("eventPhotoList", eventPhotoList);
			request.setAttribute("event", event);
			m.addAttribute("content", "eventPhotoView1.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	/* 이벤트에 사진 추가하기 */
	@RequestMapping(value = "addEventPhotos.do")
	public String addEventPhotos(HttpServletRequest request,
			HttpSession session, String eventId, Model m) {

		try {
			// eventId 로 event 객체 가져오는 기능
			Event event = eventService.searchEvent(eventId);
			request.setAttribute("event", event);

			// eventId로 해당 사진 조회하는 기능
			List<Photo> eventPhotoList = eventService.findEventPhoto(eventId);

			// userId로 event 등록이 안 된 사진만 조회하는 기능
			String userId = (String) session.getAttribute("userId");
			List<Photo> addiblePhotoList = eventService.addiblePhotos(userId);

			request.setAttribute("eventPhotoList", eventPhotoList);
			request.setAttribute("addiblePhotoList", addiblePhotoList);

			m.addAttribute("content", "addPhotos.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	/* 이벤트에 사진 변경해서 업데이트 하는 함수 */
	@RequestMapping(value = "updateEvent.do")
	public String updateEvent(HttpServletRequest request, HttpSession session,
			String eventId, Model m) {
		try {

			List<Photo> eventPhotoList = eventService.findEventPhoto(eventId);

			// photoIdList 의 사진들의 eventId 를 null로 만들기(eventDelete)
			eventService.makeEventIdNull(eventPhotoList);

			// 피카사에 저장
			String access_token = (String) session.getAttribute("token");
			for (Photo Photo : eventPhotoList) {
				if (Photo.getDescription() == null) {
					Photo.setDescription("");
				}
				Photo.setEventId("");
				update(Photo, session, access_token);
			}

			// photoIdList 를 받아온다.
			String[] checks = request.getParameter("arrFir").split(",");
			ArrayList<String> photoIdList = new ArrayList<String>();
			int checklen = checks.length;
			for (int i = 0; i < checklen; i++) {
				photoIdList.add(checks[i]);
			}
			// 받아온 eventId를 받아와서 해당 photoList에 update
			eventService.setNewEventId(photoIdList, eventId);

			// photoIdList를 바탕으로 Photo 타입의 newPhotoList를 생성
			ArrayList<Photo> newPhotoList = new ArrayList<Photo>();
			for (String p : photoIdList) {
				Photo photo = photoService.getPhoto(p);
				newPhotoList.add(photo);
			}

			String access_token1 = (String) session.getAttribute("token");
			for (Photo Photo : newPhotoList) {
				if (Photo.getDescription() == null) {
					Photo.setDescription("");
				}
				update(Photo, session, access_token1);
			}

			// eventId로 해당 사진 조회하는 기능
			List<Photo> eventPhotoList1 = eventService.findEventPhoto(eventId);

			// eventId 로 event 객체 가져오는 기능
			Event event = eventService.searchEvent(eventId);

			request.setAttribute("eventPhotoList", eventPhotoList1);
			request.setAttribute("event", event);
			m.addAttribute("content", "eventPhotoView1.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";

	}

	/* 이벤트 삭제하는 함수 */
	@RequestMapping(value = "deleteEvent.do")
	public String deleteEvent(HttpServletRequest request, HttpSession session,
			String eventId, Model m) {
		try {
			String userId = (String) session.getAttribute("userId");

			// photoIdList 를 만든다.
			String[] checks = request.getParameter("arrFir").split(",");
			ArrayList<String> photoIdList = new ArrayList<String>();

			int checklen = checks.length;

			for (int i = 0; i < checklen; i++) {
				photoIdList.add(checks[i]);
			}

			// photoIdList를 활용해서 초기화 시키고 싶은 resetPhotoList를 만든다
			ArrayList<Photo> resetPhotoList = new ArrayList<Photo>();
			for (String p : photoIdList) {
				Photo photo = photoService.getPhoto(p);
				resetPhotoList.add(photo);
			}

			// resetPhotoList 의 사진들의 eventId 를 null로 만들기(eventDelete도 함께)
			eventService.makeEventIdNull(resetPhotoList);

			// eventTable에서 해당 event를 삭제
			eventService.deleteEvent(eventId);

			// userId로 user의 정보를 가져오는 함수
			User user = userService.getUserInfo(userId);

			// userId 로 event 정보를 가져오는 함수
			List<Event> eventList = eventService.getEventList(userId);

			request.setAttribute("user", user);
			request.setAttribute("eventList", eventList);
			m.addAttribute("content", "timeLine.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}

		return "index";
	}

	/* 생일 추가 메서드 */
	@RequestMapping(value = "addBirthday.do")
	public String addBirthday(HttpServletRequest request, HttpSession session,
			String birthday, Model m) {
		try {
			String userId = (String) session.getAttribute("userId");
			userService.addBirthday(userId, birthday);

			request.setAttribute("birthday", birthday);
			//m.addAttribute("content", "timeLine.jsp");
		} catch (Exception e) {
			
			e.printStackTrace();
			return "redirect:error.do";
		}
		return "redirect:timeLinePage.do";

	}

	/* 슬라이드 쇼 */
	@RequestMapping(value = "showSlide.do")
	public String showSlide(HttpServletRequest request, String eventId, Model m) {

		try {
			// eventId로 해당 사진 조회하는 기능
			List<Photo> eventPhotoList = eventService.findEventPhoto(eventId);
			request.setAttribute("eventPhotoList", eventPhotoList);

			m.addAttribute("content", "slideshow.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";

	}

	/*
	 * 로그아웃
	 */
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index.do";
	}

	public String sortByGeotag(HttpSession session, int boundary)
		{
		try {
			String userId = (String) session.getAttribute("userId");
			Map<String, List<Photo>> sortListByGeotag = photoService.sortByGeotag(
					userId, boundary);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:error.do";
		}
		return null;
	}

	/*
	 * 로그인 시 얻은 Authrization code를 Access token으로 교환
	 */
	private String getAccessToken(String code) {
		String accessToken = null;
		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(TOKEN_URI);

		try {
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
			nameValuePairs.add(new BasicNameValuePair("code", code));
			nameValuePairs.add(new BasicNameValuePair("client_id", CLIENT_ID));
			nameValuePairs.add(new BasicNameValuePair("client_secret",
					CLIENT_SECRET));
			nameValuePairs.add(new BasicNameValuePair("redirect_uri",
					CALLBACK_URI));
			nameValuePairs.add(new BasicNameValuePair("grant_type",
					"authorization_code"));

			post.setEntity(new UrlEncodedFormEntity(nameValuePairs));
			HttpResponse resp = client.execute(post);

			accessToken = ((org.json.simple.JSONObject) JSONValue
					.parseWithException(new InputStreamReader(resp.getEntity()
							.getContent()))).get("access_token").toString();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return accessToken;
	}

	/*
	 * Access token을 통해 현재 로그인 한 userId를 획득
	 */
	private String getUserId(String access_token) throws Exception {
		org.json.simple.JSONObject userJson;
		String userId;
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet(USER_INFO_URL + "?access_token="
				+ access_token);

		HttpResponse resp = client.execute(get);

		InputStreamReader is = new InputStreamReader(resp.getEntity()
				.getContent(), "UTF-8");

		userJson = (org.json.simple.JSONObject) JSONValue
				.parseWithException(is);

		userId = userJson.get("id").toString();

		return userId;
	}

	/*
	 * Access token을 통해 현재 로그인 한 userName를 획득
	 */
	private String getUserName(String access_token) throws Exception {
		org.json.simple.JSONObject userJson;
		String userName;
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet(USER_INFO_URL + "?access_token="
				+ access_token);

		HttpResponse resp = client.execute(get);

		InputStreamReader is = new InputStreamReader(resp.getEntity()
				.getContent(), "UTF-8");

		userJson = (org.json.simple.JSONObject) JSONValue
				.parseWithException(is);

		userName = userJson.get("name").toString();

		return userName;
	}

	/*
	 * portrait album 생성
	 */
	private String createPortraitAlbum(String userId, String access_token)
			throws Exception {
		String pAlbumId = null;

		// 앨범 생성 시작
		String createUrl = PHOTO_INFO_URL + userId + "?access_token="
				+ access_token;
		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(createUrl);

		post.addHeader(new BasicHeader("GData-Version", "2.0"));

		// 생성할 앨범 정보 생성
		String content = "<entry xmlns='http://www.w3.org/2005/Atom' xmlns:media='http://search.yahoo.com/mrss/' xmlns:gphoto='http://schemas.google.com/photos/2007'>"
				+ "<title type='text'>Portrait</title>"
				+ "<summary type='text'>This album is speacial album to management photos through Portrait Application</summary>"
				+ "<gphoto:location/>"
				+ "<gphoto:access>private</gphoto:access>"
				+ "<gphoto:timestamp/>"
				+ "<media:group>"
				+ "<media:keywords>Portrait</media:keywords>"
				+ "</media:group>"
				+ "<category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/photos/2007#album'></category>"
				+ "</entry>";

		StringEntity entity = new StringEntity(content);
		entity.setContentType(new BasicHeader("Content-Type",
				"application/atom+xml"));

		post.setEntity(entity);
		HttpResponse resp = client.execute(post);

		// 생성 결과에서 AlbumID를 추출
		StringBuffer responseXml = new StringBuffer();
		InputStreamReader is = new InputStreamReader(resp.getEntity()
				.getContent(), "UTF-8");
		BufferedReader br = new BufferedReader(is);

		String line = "";
		while ((line = br.readLine()) != null) {
			responseXml.append(line);
		}

		String result = responseXml.toString();

		JSONObject albumJSON = XML.toJSONObject(responseXml.toString())
				.getJSONObject("entry");
		pAlbumId = String.valueOf(albumJSON.getLong("gphoto:id"));

		return pAlbumId;
	}

	/*
	 * 로그인한 사용자의 Portrait 앨범의 사진 feed를 JSON 객체로 변환하여 Photo List로 return
	 */
	private List<Photo> syncPhotos(String access_token, String userId,
			String pAlbumId) throws Exception {

		List<Photo> photoList = new ArrayList<Photo>();

		// 전체 사진 목록을 picasa로부터 response
		StringBuffer responseXml = new StringBuffer();
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet(PHOTO_INFO_URL + userId + "/albumid/"
				+ pAlbumId + "?access_token=" + access_token);

		HttpResponse resp = client.execute(get);

		InputStreamReader is = new InputStreamReader(resp.getEntity()
				.getContent(), "UTF-8");
		BufferedReader br = new BufferedReader(is);

		String line = "";
		while ((line = br.readLine()) != null) {
			responseXml.append(line);
		}

		boolean flag = true;

		// 사진 존재 여부를 판단하여 없는 경우에는 skip
		if (XML.toJSONObject(responseXml.toString()).has("feed")) {
			JSONArray photoJSON = null;
			try {
				photoJSON = XML.toJSONObject(responseXml.toString())
						.getJSONObject("feed").getJSONArray("entry");
			} catch (JSONException e) {
				photoJSON = new JSONArray();
				try {
					photoJSON.put(XML.toJSONObject(responseXml.toString())
							.getJSONObject("feed").getJSONObject("entry"));
				} catch (JSONException e2) {
					flag = false;
				}
			}

			// 사진이 있는 경우 JSON 객체를 분리하여 Photo 객체 생성
			if (flag) {
				for (int i = 0; i < photoJSON.length(); i++) {
					JSONObject photo = photoJSON.getJSONObject(i);
					Photo temp = parseJSON(photo, userId);
					photoList.add(temp);
				}
			}
		}

		// 전체 사진 목록을 DB에 sync(삭제 후 추가)
		photoList = photoService.syncPhoto(photoList);

		return photoList;
	}

	/*
	 * 사진 JSONObject를 Parsing 하여 Photo 객체 생성
	 */
	private Photo parseJSON(JSONObject photo, String userId) throws Exception {
		Photo temp = new Photo();
		temp.setPhotoTitle(URLDecoder.decode(photo.getJSONObject("title")
				.getString("content"), "UTF-8"));
		temp.setPhotoId(String.valueOf(photo.getLong("gphoto:id")));
		temp.setTime(String.valueOf(photo.getLong("gphoto:timestamp")));
		if (photo.getJSONObject("exif:tags").has("exif:fstop")) {
			temp.setFstop(String.valueOf(photo.getJSONObject("exif:tags")
					.getDouble("exif:fstop")));
		}
		if (photo.getJSONObject("exif:tags").has("exif:make")) {
			temp.setMake(photo.getJSONObject("exif:tags")
					.getString("exif:make"));
		}
		if (photo.getJSONObject("exif:tags").has("exif:model")) {
			temp.setModel(photo.getJSONObject("exif:tags").getString(
					"exif:model"));
		}
		if (photo.getJSONObject("exif:tags").has("exif:exposure")) {
			temp.setExposure(String.valueOf(photo.getJSONObject("exif:tags")
					.getDouble("exif:exposure")));
		}
		if (photo.getJSONObject("exif:tags").has("exif:iso")) {
			temp.setIso(String.valueOf(photo.getJSONObject("exif:tags").getInt(
					"exif:iso")));
		}
		temp.setPhotoUrl(photo.getJSONObject("content").getString("src"));
		if (photo.getJSONObject("media:group")
				.getJSONObject("media:description").has("content")) {
			temp.setDescription(URLDecoder.decode(
					photo.getJSONObject("media:group")
							.getJSONObject("media:description")
							.getString("content"), "UTF-8"));
		} else {
			temp.setDescription("{  'album':'',     'event':'',     'comments':'',  'tags': '',     'people': '', 'time': ''}");
		}
		if (photo.has("georss:where")) {
			temp.setGeoTag(photo.getJSONObject("georss:where")
					.getJSONObject("gml:Point").getString("gml:pos"));
		}
		temp.setUserId(userId);
		return temp;
	}

	/*
	 * Picasa에 사진 정보 Update
	 */
	private void update(Photo photo, HttpSession session, String access_token)
			throws Exception {
		// parameters 호출
		String userId = photo.getUserId();
		String pAlbumId = (String) session.getAttribute("pAlbumId");
		String photoId = photo.getPhotoId();
		JSONObject comments = new JSONObject();

		List<Tag> tagList = photo.getTags();

		if (tagList != null) {
			StringBuffer tags = new StringBuffer();
			for (int i = 0; i < tagList.size(); i++) {
				if (i == tagList.size() - 1) {
					tags.append(tagList.get(i).getTagName());
				} else {
					tags.append(tagList.get(i).getTagName());
					tags.append(",");
				}
			}
			comments.put("tags", URLEncoder.encode(tags.toString(), "UTF-8"));
		}

		List<People> peopleList = photo.getPeople();

		if (photo.getDescription() == null) {
			photo.setDescription("");
		}
		
		if (photo.getEventId() == null) {
			photo.setEventId("");
		}

		if (peopleList != null) {
			StringBuffer people = new StringBuffer();
			for (int i = 0; i < peopleList.size(); i++) {
				if (i == peopleList.size() - 1) {
					people.append(peopleList.get(i).getPeopleName());
				} else {
					people.append(peopleList.get(i).getPeopleName());
					people.append(",");
				}
			}
			comments.put("people",
					URLEncoder.encode(people.toString(), "UTF-8"));
		}

		System.out.println("gettime: " +photo.getTime());
		comments.put("album", photo.getAlbumId());
		System.out.println(photo.getAlbumId());
		comments.put("event", URLEncoder.encode(photo.getEventId(), "UTF-8"));
		comments.put("time", photo.getTime());
		comments.put("comments",
				URLEncoder.encode(photo.getDescription(), "UTF-8"));

		// 사진 update url
		String updateUrl = PHOTO_UPDATE_URL + userId + "/albumid/" + pAlbumId
				+ "/photoid/" + photoId + "?access_token=" + access_token;

		StringBuffer content = new StringBuffer();

		// Update Content Head
		content.append("<entry xmlns='http://www.w3.org/2005/Atom' xmlns:openSearch='http://a9.com/-/spec/opensearchrss/1.0/' xmlns:gphoto='http://schemas.google.com/photos/2007' xmlns:exif='http://schemas.google.com/photos/exif/2007' xmlns:media='http://search.yahoo.com/mrss/' xmlns:georss='http://www.georss.org/georss' xmlns:gml='http://www.opengis.net/gml'>");

		// Update Content Body
		content.append("<summary type='text'>");
		content.append(comments.toString());
		content.append("</summary>");

		// GPS 정보가 없는 경우 GPS 정보 불러와서 추가
		if (photo.getGeoTag() == null || photo.getGeoTag().trim().length() == 0) {
			if (photo.getTime() != null) {
				String pattern = "YYYYMMddHHmmss";
				GPSLog gpsLog = gpsLogService.searchLog(convertTimestamp(Long.parseLong(photo.getTime()), pattern), userId);
				String geoTag = gpsLog.getLat() + " " + gpsLog.getLng();
				content.append("<georss:where><gml:Point><gml:pos>");
				content.append(geoTag);
				content.append("</gml:pos></gml:Point></georss:where>");
			}
		}

		// Update Content Foot
		content.append("<category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/photos/2007#photo'></category></entry>");

		// patch request 생성
		HttpClient client = new DefaultHttpClient();
		HttpPatch patch = new HttpPatch(updateUrl);

		// header
		patch.addHeader(new BasicHeader("Content-Type",
				"application/xml; charset=UTF-8"));
		patch.addHeader(new BasicHeader("GData-Version", "2"));
		patch.addHeader(new BasicHeader("If-Match", "*"));

		// update 내용을 request에 추가
		StringEntity entity = new StringEntity(content.toString());

		patch.setEntity(entity);
		HttpResponse resp = client.execute(patch);
		System.out.println(resp.getStatusLine().getStatusCode());
		System.out.println(resp.getStatusLine().getReasonPhrase());

	}

	/*
	 * 이미지 비율에 맞추어 사진 Resize 후 저장
	 */
	private int[] resize(File file, String path, int width, int height)
			throws Exception {
		// 최대 upload 크기인 2048 * 2048을 초과하는 경우 이미지를 비율에 맞추어 Resize
		Image image = null;

		String suffix = file.getName()
				.substring(file.getName().lastIndexOf('.') + 1).toLowerCase();

		// jpg의 경우 속도를 위해 별도로 Image 객체 생성
		if (suffix.equals("bmp") || suffix.equals("png")
				|| suffix.equals("gif")) {
			image = ImageIO.read(file);
		} else {
			image = new ImageIcon(file.toURL()).getImage();
		}

		float ratio = 0;

		// 긴 축을 기준으로 이미지 비율 지정
		if (width > height) {
			ratio = maxWidth / (float) width;
		} else {
			ratio = maxHeight / (float) height;
		}

		// resize를 위한 가로, 세로 지정
		width = (int) (width * ratio);
		height = (int) (height * ratio);

		// resize 수행
		Image resizedImg = image.getScaledInstance(width, height,
				image.SCALE_SMOOTH);

		int pixels[] = new int[width * height];
		PixelGrabber pg = new PixelGrabber(resizedImg, 0, 0, width, height,
				pixels, 0, width);
		try {
			pg.grabPixels();
		} catch (InterruptedException e) {
			throw new IOException(e.getMessage());
		}
		BufferedImage destImg = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		destImg.setRGB(0, 0, width, height, pixels, 0, width);

		File resizedFile = new File(path);
		ImageIO.write(destImg, suffix, file);

		int[] resize = new int[] { width, height };

		return resize;

	}

	/*
	 * Portrait에서 사용할 앨범 생성
	 * 
	 * @type - DEFAULT: 시스템 생성 앨범, '미분류 앨범', '전체 앨범' - USER: 사용자 생성 앨범
	 */
	private String createAlbum(String albumTitle, String userId, String type)  {
		Album album = new Album();
		album.setAlbumTitle(albumTitle);
		album.setUserId(userId);
		album.setType(type);
		return albumService.createAlbum(album);
	}

	/*
	 * 업로드 할 사진 원본의 EXIF 데이터 추출
	 */
	private static TiffOutputSet getMetadata(final File jpegImageFile)
			throws ImageReadException, IOException, ImageWriteException {
		TiffOutputSet outputSet = null;

		// metadata might be null if no metadata is found.
		final IImageMetadata metadata = Imaging.getMetadata(jpegImageFile);
		final JpegImageMetadata jpegMetadata = (JpegImageMetadata) metadata;
		if (null != jpegMetadata) {
			// Exif might be null if no Exif metadata is found.
			final TiffImageMetadata exif = jpegMetadata.getExif();

			if (null != exif) {
				outputSet = exif.getOutputSet();
			}
		}
		return outputSet;
	}

	/*
	 * Resize된 사진에 원본 사진 EXIF 덮어 씌우기 (사진 사이즈가 복구되는 문제 발생)
	 */
	public static void writeExifData(File jpegImageFile, File destImageFile,
			int[] resize) throws IOException, ImageReadException,
			ImageWriteException {
		try (OutputStream os = new BufferedOutputStream(new FileOutputStream(
				destImageFile))) {
			TiffOutputSet outputSet = getMetadata(jpegImageFile);
			new ExifRewriter().updateExifMetadataLossless(jpegImageFile, os,
					outputSet);
		}
	}

	/*
	 * 사진에 태그 추가
	 */
	private Tag addTag(String tagName, String userId, String photoId) {
		return tagService.addTag(tagName, userId, photoId);
	}

	/*
	 * 사진에 인물 태그 추가
	 */
	private People addPeople(String peopleName, String photoId, String userId) {
		return peopleService.addPeople(peopleName, photoId, userId);
	}

	/*
	 * Timestamp를 시간형태의 String으로 변환
	 */
	private String convertTimestamp(Long timestamp, String pattern) {
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String time = formatter.format(new Timestamp(timestamp));
		return time;
	}

	/*
	 * 일반 시간을 Timestamp 형태로 변환
	 */
	private String makeTimestamp(String time, String pattern) throws Exception {
		// 2014-10-25 (AM) 09:44:49
		if (pattern == null || pattern.trim().length() == 0) {
			pattern = "yyyy-MM-dd (a) HH:mm:ss";
		}
		SimpleDateFormat toFormatter = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat fromFormatter = new SimpleDateFormat(pattern);
		
		Date date = toFormatter.parse(toFormatter.format(fromFormatter.parse(time)));
		Calendar cal = toFormatter.getCalendar();
		
		String timestamp = cal.getTime().getTime() + "";
		
		return timestamp;
	}

	/* shareFriends를 위한 사진 리스트 페이지로 이동 */
	@RequestMapping(value = "shareFriends.do")
	public String shareFriends(HttpServletRequest request, HttpSession session,
			Model m) {
		try {
			String publishUserId = (String) session.getAttribute("userId");
			// 보내는 사람 이름을 받아온다.
			String publishUserName = (userService.getUserInfo(publishUserId))
					.getUserName();

			String _receivedUserName = request.getParameter("receivedUserName");

			// photoIdList 를 받아온다.
			ArrayList<String> photoIdList = new ArrayList<String>();
			String[] checks = request.getParameter("arrFir3").split(",");

			int checklen = checks.length;
			for (int i = 0; i < checklen; i++) {
				photoIdList.add(checks[i]);
			}

			// photoId를 활용해 photoUrlList와 photoTitleList를 만든다.

			/*
			 * List<String> photoUrlList = new ArrayList<String>(); List<String>
			 * photoTitleList = new ArrayList<String>();
			 */

			List<Photo> photoList = new ArrayList<Photo>();

			for (String photoId : photoIdList) {
				Photo p = photoService.getPhoto(photoId);
				photoList.add(p);
				/*
				 * photoUrlList.add(p.getPhotoUrl());
				 * photoTitleList.add(p.getPhotoTitle());
				 */
			}

			// publishIdList를 받아온다.
			String[] tagArr = _receivedUserName.split(",");
			List<String> receivedUserNameList = new ArrayList<String>(
					Arrays.asList(tagArr));

			// receivedUserNameList로 아이디를 불러온다.
			List<String> receivedUserIdList = new ArrayList<String>();
			for (String receivedUserName : receivedUserNameList) {
				User user = userService.getUserInfoByName(receivedUserName.trim());

				receivedUserIdList.add(user.getUserId());

			}

			// photoUrl을 가지고 photoPath를 만들어 localPath에 다운로드
			// 공유할 사진 정보를 DB에 등록
			publishService.publishPhoto(photoList, publishUserId,
					receivedUserIdList, publishUserName);

			m.addAttribute("content", "albumList2.jsp");
		} catch (Exception e) {

			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}

	
	/*공유된 앨범 수락*/
	@RequestMapping(value = "acceptPublish.do")
	public String acceptPublish(HttpServletRequest request, HttpSession session, Model m) {
		
		String publishAlbumId = request.getParameter("publishAlbumId");
		System.out.println("albumId:"+ publishAlbumId);
		String receiveUserId = (String) session.getAttribute("userId");
		
		
		//userId와 publishAlbumId를 이용해 해당 앨범의 사진을 리스트로 가지고 온다.
		List<Publish> acceptList = publishService.getPublish(receiveUserId, publishAlbumId);
		
		
		String albumId= null;
		//acceptList를 활용해 새로운 file을 생성한다. 
		
		
		//해당 목록을 가져와 새 앨범을 생성하고 사진을 넣는다. 
		for(Publish publish: acceptList){
			
			//acceptList를 가져와 receivedMsg를 True, accept를 True 로 바꾼다.(확인 O, 수락 O)
			publishService.acceptPublish(publish);	

		// session에서 userId, albumId, access token을 획득
		String userId = (String) session.getAttribute("userId");
		String pAlbumId = (String) session.getAttribute("pAlbumId");
		String access_token = (String) session.getAttribute("token");
		List<Album> albumList;
	
		// 새로 입력된 앨범명의 존재 여부 확인 후 앨범 Id 호출
		albumId = albumService.searchAlbumTitle(userId, publish.getPublishAlbumTitle());
		
		if (albumId == null || albumId.trim().length() == 0) {
		
		albumId = createAlbum(publish.getPublishAlbumTitle(), userId, "USER");
		 albumList = albumService.getAlbumList(userId);
		Collections.sort(albumList, new albumNameCompare());
		session.setAttribute("albumList", albumList);
		}
		
		try {
			// 사진을 보낼 url
			String upUrl = PHOTO_INFO_URL + userId + "/albumid/" + pAlbumId 
					+ "?access_token=" + access_token;

			//	metadata와 함께 file을 picasa album으로 전송
				 
				HttpClient client = new DefaultHttpClient();
				HttpPost post = new HttpPost(upUrl);

				

			/// 여기 전단계까지 url 을 가지고 file 객체를 생성해 와야 한다.	
			// 그 단계에서 addPhoto.do에 있는 앨범명 생성 함수를 찾아와서 쓸 것!
			//File file = mRequest.getFile(publish.getPhotoPath());
				
				//url 을 가지고 file 객체를 생성
				File file = new File(publish.getPhotoPath());

				String _originalFileName = publish.getPhotoPath(), originalFileName;
				int i = _originalFileName.indexOf("/");
				originalFileName = _originalFileName.substring(i+1);
				

				String path = request.getServletContext().getRealPath(
						saveThumnailDirectory)
						+ "/" + originalFileName;

				
				// picasa에 사진 전송
				post.addHeader(new BasicHeader("Content-Type",
						"multipart/related; boundary=" + boundary));
				post.addHeader(new BasicHeader("MIME-version", "1.0"));

				// 파일명 인코딩
				String encodede = URLEncoder.encode(originalFileName, "UTF-8");

				String metadata = "<entry xmlns='http://www.w3.org/2005/Atom'>"
						+ "<title>"
						+ encodede // 파
						+ "</title>"
						+ "<summary>"
						+ "</summary>"
						+ "<category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/photos/2007#photo'></category>"
						+ "</entry>";

				MultipartEntityBuilder meb = MultipartEntityBuilder.create();
				meb.setBoundary(boundary);
				meb.setMode(HttpMultipartMode.STRICT);
				meb.setCharset(Charset.forName("UTF-8"));

				meb.addTextBody("metadata", metadata, ContentType
						.create("application/atom+xml; charset=UTF-8"));
				meb.addBinaryBody("file", file, ContentType
						.create(URLConnection
								.guessContentTypeFromName(originalFileName)),
						originalFileName);

				post.setEntity(meb.build());
				HttpResponse resp = client.execute(post);

				// 생성 결과
				StringBuffer responseXml = new StringBuffer();
				InputStreamReader is = new InputStreamReader(resp.getEntity()
						.getContent(), "UTF-8");
				BufferedReader br = new BufferedReader(is);

				String line = "";
				while ((line = br.readLine()) != null) {
					responseXml.append(line);
				}
				
				// 업로드 완료 시 picasa에 사진 정보 추가
				JSONObject photoJSON = XML.toJSONObject(responseXml.toString())
						.getJSONObject("entry");
				Photo newPhoto = parseJSON(photoJSON, userId);
				newPhoto = photoService.newPhoto(newPhoto, userId);
				newPhoto.setAlbumId(albumId);
				update(newPhoto, session, access_token);
				photoService.updatePhoto(newPhoto);

				albumList = albumService.getAlbumList(userId);
				Collections.sort(albumList, new albumNameCompare());
				session.setAttribute("albumList", albumList);

				
				} catch (Exception e) {
					e.printStackTrace();
					m.addAttribute("content", "error.jsp");
			}
		
		}
		//변경 후 session에 alertList를 변경한다. 
				List<Publish> alertList = publishService.getPublishInfo(receiveUserId);
				session.setAttribute("alertList", alertList);
		return "redirect:albumView.do?albumId=" + albumId;
	}
	
	
	/*공유된 앨범 거절*/
	@RequestMapping(value = "denyPublish.do")
	public String denyPublish(HttpServletRequest request, HttpSession session, Model m) {
		try {
			String publishAlbumId = request.getParameter("publishAlbumId");
			System.out.println("albumId:"+ publishAlbumId);
			String receiveUserId = (String) session.getAttribute("userId");
			//userId와 publishAlbumId를 이용해 해당 앨범의 사진을 리스트로 가지고 온다.
			List<Publish> denyList = publishService.getPublish(receiveUserId, publishAlbumId);
			
			//denyList를 가져와 receivedMsg를 True, accept를 false 로 바꾼다.(확인 O, 수락X)
			for(Publish publish: denyList){
				publishService.denyPublish(publish);
			}
			
			//변경 후 session에 alertList를 변경한다. 
			List<Publish> alertList = publishService.getPublishInfo(receiveUserId);
			session.setAttribute("alertList", alertList);
			
			
			m.addAttribute("content", "mainUi.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}
	
	@RequestMapping(value = "gpslog.do")
    public void gpslog(String latitude, String longitude, String token) throws Exception {
		try {
			String userId = getUserId(token);
			GPSLog gpsLog = new GPSLog(latitude, longitude, userId);
			gpsLogService.addLog(gpsLog);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
	@RequestMapping(value = "getout.do")
	public void getout(HttpSession session) {
		
	}

	/* 모바일용 peopleView */
	@RequestMapping(value = "mobilePeopleView.do")
	public String mobilePeopleView(HttpServletRequest request, HttpSession session, Model m){
		
		m.addAttribute("content","mobilePeopleView.jsp");
		return "index";
	}
	
	/* 검색 후 결과 화면 */
	@RequestMapping(value = "searchResultView.do")
	public String searchResultView(HttpServletRequest request, HttpSession session, Model m) {
		
		try {
			String userId = (String) session.getAttribute("userId");
			Search keyWords = new Search();
			
			String[] tagArr = request.getParameter("tagArr").split(",");
			String[] peopleArr = request.getParameter("peopleArr").split(",");
			String[] geoArr = request.getParameter("geoArr").split(",");
			String[] dateArr = request.getParameter("dateArr").split("~");
			
			List<String> tagKeywords = new ArrayList<String>(Arrays.asList(tagArr));
			List<String> peopleKeywords = new ArrayList<String>(Arrays.asList(peopleArr));
			List<String> geoKeywords = new ArrayList<String>(Arrays.asList(geoArr));
			
			String fromDate = "";
			String toDate = "";
			
			keyWords.setUserId(userId);
			
			if (tagKeywords.get(0).trim().length() != 0) {
				keyWords.setTagKeywords(tagKeywords);
			}
			
			if (peopleKeywords.get(0).trim().length() != 0) {
				keyWords.setPeopleKeywords(peopleKeywords);
			}
			
//		Map<String, List<Photo>> map = photoService.sortByGeotag(userId, 500);
			List<String> geoPhotoList = new ArrayList<String>();

			System.out.println(geoKeywords.get(0).trim().length());
			if (geoKeywords.get(0).trim().length() != 0) {
				for (String key : geoKeywords) {
					System.out.println(key.trim());
					for(Photo photo : sortList.get(key.trim())) {
						geoPhotoList.add(photo.getPhotoId());
					}
				}
				keyWords.setGeoPhotoList(geoPhotoList);
			}
			
			if (dateArr.length > 1) {
				fromDate = dateArr[0];
				toDate = dateArr[1];

				String pattern = "MM/dd/yyyy";
				fromDate = makeTimestamp(fromDate, pattern);
				toDate = makeTimestamp(toDate, pattern);
				keyWords.setFromDate(fromDate);
				keyWords.setToDate(toDate);
			}
			
			System.out.println(keyWords);
			
			List<Photo> searchResult = photoService.search(keyWords);
			
			List<String> keywordList = new ArrayList<String>();
			for (String tag : tagKeywords) {
				if (tag.trim().length() != 0) {
					keywordList.add(tag);
				}
			}
			for (String people : peopleKeywords) {
				if (people.trim().length() != 0) {
					keywordList.add(people);
				}
			}
			for (String geo : geoKeywords) {
				if (geo.trim().length() != 0) {
					keywordList.add(geo);
				}
			}
			if (dateArr[0].trim().length() != 0) {
				keywordList.add(request.getParameter("dateArr"));
			}

			m.addAttribute("keyword", keywordList);
			m.addAttribute("result", searchResult);
			m.addAttribute("content","searchResultView.jsp");
		} catch (Exception e) {
			m.addAttribute("content", "error.jsp");
			e.printStackTrace();
		}
		return "index";
	}
	
	@RequestMapping(value="about.do")
	public String about(){
		return "aboutView";
	}
	
	
	/* Services 화면 */
	@RequestMapping(value="services.do")
	public String Services(){
		return "services";
	}
	
	/* 에러페이지로 이동 */
	@RequestMapping(value = "error.do")
	public String error(HttpServletRequest request, HttpSession session,
			Model m) {

		m.addAttribute("content", "error.jsp");

		return "index";
	}
	
}
