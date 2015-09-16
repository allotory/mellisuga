package com.mellisuga.dao;

import com.mellisuga.model.Member;

public interface MemberDAO {

	public void insertMember(Member member);
	
	public Member queryMemberByName(Member member);
}
