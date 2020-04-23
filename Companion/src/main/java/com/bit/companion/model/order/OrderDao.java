package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.companion.model.entity.order.OrderVo;

import net.sf.json.JSONArray;

public interface OrderDao {
	//product list select
	List<OrderVo> OrderSelectAll() throws SQLException;
	//order detail
	void OrderInfo_Details(OrderVo orderVo) throws SQLException;
	//order success
	OrderVo OrderProductPurchaseOne(int product_id) throws SQLException;

	//cart
	void OrderCartAdd(OrderVo orderVo) throws SQLException;
	
}
