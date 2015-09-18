package com.mellisuga.db;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.PermissionDAO;
import com.mellisuga.model.Permission;

public class InitDB {

	public static void main(String[] args) {
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
//			// 角色
//			RoleDAO roleDAO = session.getMapper(RoleDAO.class);
//			
//			Role role0 = new Role();
//			role0.setRolename("NormalUser");
//			role0.setPid(0);
//			role0.setStatus(1);
//			role0.setRemark("普通用户，可以评论、私信、回答");
//			
//			Role role1 = new Role();
//			role1.setRolename("LimitedUser1");
//			role1.setPid(0);
//			role1.setStatus(1);
//			role1.setRemark("一级受限用户，不能评论，可以私信、回答");
//			
//			Role role2 = new Role();
//			role2.setRolename("LimitedUser2");
//			role2.setPid(0);
//			role2.setStatus(1);
//			role2.setRemark("二级受限用户，不能评论、私信，只可回答");
//			
//			Role role3 = new Role();
//			role3.setRolename("LimitedUser3");
//			role3.setPid(0);
//			role3.setStatus(1);
//			role3.setRemark("三级受限用户，不能评论、私信、回答");
//			
//			Role role4 = new Role();
//			role4.setRolename("BlockedUser");
//			role4.setPid(0);
//			role4.setStatus(0);
//			role4.setRemark("封禁用户，帐号停用");
//
//			roleDAO.insertRole(role0);
//			roleDAO.insertRole(role1);
//			roleDAO.insertRole(role2);
//			roleDAO.insertRole(role3);
//			roleDAO.insertRole(role4);
			

			// 权限
			PermissionDAO permissionDAO = session.getMapper(PermissionDAO.class);

			Permission permission0 = new Permission();
			permission0.setName("Comment");
			permission0.setTitle("评论");
			permission0.setStatus(1);
			permission0.setRemark("评论权限，包括问题和答案");
			permission0.setSort(50);
			permission0.setPid(0);
			permission0.setLevel(1);
			
			Permission permission1 = new Permission();
			permission1.setName("PrivateMessage");
			permission1.setTitle("私信");
			permission1.setStatus(1);
			permission1.setRemark("发送私信权限");
			permission1.setSort(50);
			permission1.setPid(0);
			permission1.setLevel(1);
			
			Permission permission2 = new Permission();
			permission2.setName("Answer");
			permission2.setTitle("回答");
			permission2.setStatus(1);
			permission2.setRemark("回答问题权限");
			permission2.setSort(50);
			permission2.setPid(0);
			permission2.setLevel(1);

			permissionDAO.insertPermission(permission0);
			permissionDAO.insertPermission(permission1);
			permissionDAO.insertPermission(permission2);
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
		
	}
}
