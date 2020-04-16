package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.OrderReviewVo;
import com.bit.companion.model.order.OrderReviewDao;

@Service
public class OrderReviewServiceImpl implements OrderReviewService {
	
	@Autowired
	OrderReviewDao orderReviewDao;
	
	//이용 후기.
	@Override
	public List<OrderReviewVo> orderReviewList(Model model, int product_id){
		List<OrderReviewVo> list = null;
		try {
			list=orderReviewDao.ReviewList(product_id);
			model.addAttribute("orderReviewList",list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		 
		
		return list;
	}

}
