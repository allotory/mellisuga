package com.mellisuga.dao;

import com.mellisuga.model.Member;

public interface MemberDAO {

	// 插入成员
	public void insertMember(Member member);
	
	// 通过
	public Member queryMemberByUserID(int user_id);
}
 