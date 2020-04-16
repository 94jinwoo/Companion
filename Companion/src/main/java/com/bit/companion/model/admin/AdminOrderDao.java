package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.model.entity.admin.AdminOrderDetailVo;
import com.bit.companion.model.entity.admin.AdminOrderVo;

public interface AdminOrderDao {
	
	//Admin Order List
	List<AdminOrderVo> selectAll() throws SQLException;

	AdminOrderVo selectOne(int order_id) throws SQLException;

	List<AdminOrderDetailVo> selectOneDetail(int order_id) throws SQLException;

}
