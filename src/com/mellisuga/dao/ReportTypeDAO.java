package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.ReportType;

public interface ReportTypeDAO {

	// 插入举报类型
	public void insertReportType(ReportType reportType);
	
	// 由是否是通用类型查询举报类型
	public List<ReportType> queryReportTypeByIsCommon(int is_common);
	
	// 查询全部举报类型(即问题的举报类型)
	public List<ReportType> queryAllReportType();
}
