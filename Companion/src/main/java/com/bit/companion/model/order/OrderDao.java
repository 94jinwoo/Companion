package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.companion.model.entity.order.OrderVo;

import net.sf.json.JSONArray;

public interface OrderDao {

	List<OrderVo> OrderSelectAll() throws SQLException;
	void OrderInfo_Details(OrderVo orderVo) throws SQLException;
	OrderVo OrderProductPurchaseOne(int product_id) throws SQLException;

	//장바구니용
	void OrderCartAdd(OrderVo orderVo) throws SQLException;
	int CartOrderPurchase(List<OrderVo> orderVo) throws SQLException;
	
}
