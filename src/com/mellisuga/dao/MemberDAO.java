package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.Member;

public interface MemberDAO {

	// 插入成员
	public void insertMember(Member member);
	
	// 通过用户ID查询成员信息
	public Member queryMemberByUserID(int user_id);
	
	// 更新用户
	public void updateMember(Member member);
	
	// 通过ID查询成员信息
	public Member queryMemberByID(int id);
	
	// 有用户名模糊查询
	public List<Member> queryMemberByLike(String text);
}
 