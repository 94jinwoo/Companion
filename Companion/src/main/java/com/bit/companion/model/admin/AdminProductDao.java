package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.model.entity.admin.AdminCategoryVo;

public interface AdminProductDao {
	
	//ī�װ�
	List<AdminCategoryVo> selectCategory() throws SQLException;

}
