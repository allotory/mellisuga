package com.mellisuga.dao;

import com.mellisuga.model.Permission;

public interface PermissionDAO {

	public void insertPermission(Permission permission);

	public Permission queryPermissionByName(Permission permission);
}
