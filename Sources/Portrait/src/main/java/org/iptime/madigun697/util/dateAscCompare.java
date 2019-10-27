package org.iptime.madigun697.util;

import java.util.Comparator;

public class dateAscCompare implements Comparator<String> {

	@Override
	public int compare(String o1, String o2) {
		String[] o1Arr = o1.split(" ");
		String[] o2Arr = o2.split(" ");
		
		for (int i = 0; i < o1Arr.length; i++) {
			if (o1Arr[i].compareTo(o2Arr[i]) != 0) {
				return o1Arr[i].compareTo(o2Arr[i]) * -1;
			}
		}
		
		return 0;
	}

}
