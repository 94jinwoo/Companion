package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.OrderVo;

import net.sf.json.JSONArray;

public interface OrderService {
	//product list info
	void list(Model model,int product_id);
	//product list detail one
	void OrderInfo_Detail(OrderVo orderVo);
	//cart add 
	void insertCart(Model model,OrderVo orderVo);
	
	
}
 