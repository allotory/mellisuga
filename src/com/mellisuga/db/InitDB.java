package com.mellisuga.db;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.RoleDAO;
import com.mellisuga.model.Role;

public class InitDB {

	public static void main(String[] args) {
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 角色
			RoleDAO roleDAO = session.getMapper(RoleDAO.class);
			
			Role role0 = new Role();
			role0.setRolename("NormalUser");
			role0.setPid(0);
			role0.setStatus(1);
			role0.setRemark("普通用户，可以评论、私信、回答");
			
			Role role1 = new Role();
			role1.setRolename("LimitedUser1");
			role1.setPid(0);
			role1.setStatus(1);
			role1.setRemark("一级受限用户，不能评论，可以私信、回答");
			
			Role role2 = new Role();
			role2.setRolename("LimitedUser2");
			role2.setPid(0);
			role2.setStatus(1);
			role2.setRemark("二级受限用户，不能评论、私信，只可回答");
			
			Role role3 = new Role();
			role3.setRolename("LimitedUser3");
			role3.setPid(0);
			role3.setStatus(1);
			role3.setRemark("三级受限用户，不能评论、私信、回答");
			
			Role role4 = new Role();
			role4.setRolename("BlockedUser");
			role4.setPid(0);
			role4.setStatus(0);
			role4.setRemark("封禁用户，帐号停用");

			roleDAO.insertRole(role0);
			roleDAO.insertRole(role1);
			roleDAO.insertRole(role2);
			roleDAO.insertRole(role3);
			roleDAO.insertRole(role4);
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
		
	}
}
