package org.iptime.madigun697.util;

import java.util.Comparator;

import org.iptime.madigun697.vo.Album;

public class albumNameCompare implements Comparator<Album> {

	@Override
	public int compare(Album o1, Album o2) {
		
		String[] o1Arr = o1.getAlbumId().split("_");
		String[] o2Arr = o2.getAlbumId().split("_");
		
		if (o1Arr[1].equals("recycle")) {
			return 1;
		} else if (o2Arr[1].equals("recycle")) {
			return -1;
		} else if (o1Arr[1].equals("unsort") && o2Arr[1].equals("all")) {
			return -1;
		} else if (o2Arr[1].equals("unsort") && o1Arr[1].equals("all")) {
			return 1;
		} else if (o1Arr[1].equals("unsort") || o1Arr[1].equals("all")) {
			return -1;
		} else if (o2Arr[1].equals("unsort") || o2Arr[1].equals("all")) {
			return 1;
		} else {
			return o1Arr[1].compareTo(o2Arr[1]);
		}
	}
	
}
