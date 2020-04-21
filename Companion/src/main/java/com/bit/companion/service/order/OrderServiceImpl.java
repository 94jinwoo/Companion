package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.OrderVo;
import com.bit.companion.model.order.OrderDao;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao orderDao;

	
	//단일 상품 구매 할 때. 상품 구매페이지에 필요한 정보 부르
	//는 메서드
	@Override
	public void list(Model model,int product_id) {

		try {
			orderDao.OrderProductPurchaseOne(product_id);
			model.addAttribute("orderProductPurchaseOne",orderDao.OrderProductPurchaseOne(product_id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	//	상품 구매 
	//	실제 orderSuccess 페이지에서 4개 insert 
	//	DAO에서 트랜잭션 처리. or service에서 처리.
	@Override
	public void OrderInfo_Detail(OrderVo orderVo) {

		try {
			orderDao.OrderInfo_Details(orderVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	} 

//  장바구니에 상품 담기.
	@Override
	public void insertCart(Model model, OrderVo orderVo) {
		
		try {
			orderDao.OrderCartAdd(orderVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public int insert_test(List<OrderVo> orderVo) throws SQLException {
		
		return orderDao.CartOrderPurchase(orderVo);
	}
}
