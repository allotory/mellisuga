package com.mellisuga.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

	public static String getTimeDifference(Timestamp t) {
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		long timeDifference = now.getTime() - t.getTime();
		
		long second = 1000L;
		long minute = 1000L*60;
		long hour = 1000L*60*60;
		long day = 1000L*60*60*24;
		long month = 1000L*60*60*24*30;
		long year = 1000L*60*60*24*365;
		
		String time = "";
		
		if(timeDifference > second && timeDifference <= minute) {
			// 时间大于1秒钟，小于1小分钟
			time = timeDifference / second + "秒前";
		} else if(timeDifference > minute && timeDifference <= hour) {
			// 时间大于1分钟，小于1小时
			time = timeDifference / minute + "分钟前";
		} else if(timeDifference > hour && timeDifference <= day) {
			// 时间大于1小时，小于1天
			time = timeDifference / hour + "小时前";
		} else if(timeDifference > day && timeDifference <= month) {
			// 时间大于1天，小于1月
			time = timeDifference / day + "天前";
		} else if(timeDifference > month && timeDifference <= year) {
			// 时间大于1月，小于1年
			time = timeDifference / month + "月前";
		} else if(timeDifference > year) {
			// 时间大于1年
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			time = sdf.format(t);
		}
		
		return time;
	}
	
	public static String getPostTime(Timestamp t) {
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		long timeDifference = now.getTime() - t.getTime();
		
		long day = 1000L*60*60*24;
		
		String time = "";
		
		if(timeDifference > 0 && timeDifference <= day) {
			// 时间小于1天
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			time = sdf.format(t);
		} else if(timeDifference > day) {
			// 时间大于1天
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			time = sdf.format(t);
		}
		
		return time;
	}
	
	public static void main(String[] args) {
		
		Timestamp date  = Timestamp.valueOf("2015-12-01 13:21:02");
		//System.out.print(TimeUtils.getTimeDifference(date));
		System.out.print(TimeUtils.getPostTime(date));
	}
}
