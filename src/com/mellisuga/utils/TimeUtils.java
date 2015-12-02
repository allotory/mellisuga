package com.mellisuga.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

	public static Timestamp getTimeDifference(Timestamp t) {
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		System.out.println(now.getTime() - t.getTime());
		
		long timeDifference = now.getTime() - t.getTime();
		
		long second = 1000L;
		long minute = 1000L*60;
		long hour = 1000L*60*60;
		long day = 1000L*60*60*24;
		long month = 1000L*60*60*24*30;
		long year = 1000L*60*60*24*365;
		
		System.out.println("一小时内："+ hour);
		System.out.println("24小时内："+ day);
		System.out.println("一月内："+ month);
		System.out.println("一年内："+ year);

		if(timeDifference > second && timeDifference <= minute) {
			// 时间大于1秒钟，小于1小分钟
			System.out.println(timeDifference / second);
		} else if(timeDifference > minute && timeDifference <= hour) {
			// 时间大于1分钟，小于1小时
			System.out.println(timeDifference / minute);
		} else if(timeDifference > hour && timeDifference <= day) {
			// 时间大于1小时，小于1天
			System.out.println(timeDifference / hour);
		} else if(timeDifference > day && timeDifference <= month) {
			// 时间大于1天，小于1月
			System.out.println(timeDifference / day);
		} else if(timeDifference > month && timeDifference <= year) {
			// 时间大于1月，小于1年
			System.out.println(timeDifference / month);
		} else if(timeDifference > year) {
			// 时间大于1年
			System.out.println(t);
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		
		Timestamp date  = Timestamp.valueOf("2015-12-02 22:42:02");
		System.out.print(TimeUtils.getTimeDifference(date));
	}
}
