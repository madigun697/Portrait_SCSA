package org.iptime.madigun697.service;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.List;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.imageio.ImageIO;

import org.iptime.madigun697.dao.PublishDao;
import org.iptime.madigun697.vo.Photo;
import org.iptime.madigun697.vo.Publish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PublishServiceImpl implements PublishService{

	@Autowired 
	private PublishDao publishDao;
	
	//photoUrl을 가지고 photoPath를 만들어 localPath에 다운로드
	@Override
	public void publishPhoto(List<Photo> photoList, String publishUserId, 
								List<String> receivedUserIdList, String publishUserName) {
		
		String publishAlbumId=(Math.random()*100000)+"";
		String photoPath = null;
		String publishAlbumTitle=publishUserName+"님이 보낸 앨범";
		
		
		for(String receiveUserId: receivedUserIdList){
			
				
				for(Photo p: photoList){
					String publishId = (Math.random()*100000)+publishUserId.substring(0, 3);
					
						String name = p.getPhotoTitle();
						String photoUrl= p.getPhotoUrl();
						
						
						
						String file_ext=name.substring(
								name.lastIndexOf('.')+1,
								name.length());
						
						BufferedImage image = null;
						try{
							image = ImageIO.read(new URL(photoUrl));
							BufferedImage bufferedImage = new BufferedImage(image.getWidth(),image.getHeight(), BufferedImage.TYPE_INT_BGR);
							
							Graphics2D graphics = (Graphics2D) bufferedImage.getGraphics();
							graphics.setBackground(Color.WHITE);
							graphics.drawImage(image, 0, 0, null);
							
							ImageIO.write(bufferedImage, file_ext, new File("C:\\scsa\\test"+"/"+name));
							photoPath = "C:\\scsa\\test"+"/"+name;
							
							//insert DB
							publishDao.insertPublishDB(new Publish(publishId, receiveUserId, publishUserId, publishAlbumId, publishAlbumTitle, photoPath));
							
							System.out.println(name+" 다운완료");
							//count = 0;
						}catch(Exception e){
							e.printStackTrace();
						}
		
					}
		}
	}

	//내게 전송된 사진 목록 중 받지 않은 것들의 앨범아이디를 들고 옴
	@Override
	public List<Publish> getPublishInfo(String userId) {
		
		List<Publish> list = publishDao.getPublishInfo(userId);
		
		return list;
	}

	//userId와 publishAlbumId를 이용해 해당 앨범의 사진을 가지고 온다.
	@Override
	public List<Publish> getPublish(String receiveUserId, String publishAlbumId) {
		List<Publish> list = publishDao.getPublish(receiveUserId, publishAlbumId);
		return list;
	}

	
	//denyList를 가져와 receivedMsg를 True, accept를 false 로 바꾼다.(확인 O, 수락X)
	@Override
	public void denyPublish(Publish publish) {
		publishDao.denyPublish(publish);
		
	}

	//acceptList를 가져와 receivedMsg를 True, accept를 True 로 바꾼다.(확인 O, 수락 O)
	@Override
	public void acceptPublish(Publish publish) {
		publishDao.acceptPublish(publish);
		
	}

	
	

}
