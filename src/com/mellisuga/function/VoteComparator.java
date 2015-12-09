package com.mellisuga.function;

import java.util.Comparator;

import com.mellisuga.bean.AnswerBean;

public class VoteComparator implements Comparator<AnswerBean>{

	@Override
	public int compare(AnswerBean o1, AnswerBean o2) {
		
		int flag = o1.getAnswerWeight().compareTo(o2.getAnswerWeight());
		
		// 权重相等时按时间排序
		if(flag == 0) {
			return o1.getAnswer().getAnswer_date()
					.compareTo(o2.getAnswer().getAnswer_date());
		}
		
		// 倒序
		if(flag > 0) {
			flag = -1;
		} else {
			flag = 1;
		}
		
		return flag;
	}



}
