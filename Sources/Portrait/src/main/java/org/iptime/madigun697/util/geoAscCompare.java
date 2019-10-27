package org.iptime.madigun697.util;

import java.util.Comparator;

public class geoAscCompare implements Comparator<String> {

	@Override
	public int compare(String o1, String o2) {
		if (o1.substring(0, 2).equals("한국") && o2.substring(0, 2).equals("한국")) {
			return o1.compareTo(o2);
		} else if (o1.substring(0, 2).equals("한국") && !o2.substring(0, 2).equals("한국")) {
			return -1;
		} else if (o2.substring(0, 2).equals("한국") && !o1.substring(0, 2).equals("한국")) {
			return 1;
		} else {
			return o1.compareTo(o2);
		}
	}

	
	
}
