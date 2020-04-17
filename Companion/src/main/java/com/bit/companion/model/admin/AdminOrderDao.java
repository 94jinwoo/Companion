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

	void updateRelease(int order_id) throws SQLException;

	void updateCancel(int order_id) throws SQLException;

	void updateDelivery(int order_id) throws SQLException;

	void updateDelivering(int order_id) throws SQLException;

	void updateReleaseDone(int order_id) throws SQLException;

	void updateAdminDelivery(int order_id) throws SQLException;

	void updatePurchase(int order_id) throws SQLException;

	void updateExchange(int order_id) throws SQLException;

	void updateReturn(int order_id) throws SQLException;
}
