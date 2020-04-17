package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.common.Pagination_P;
import com.bit.companion.model.entity.order.OrderReviewVo;
import com.bit.companion.model.order.OrderReviewDao;

@Service
public class OrderReviewServiceImpl implements OrderReviewService {
	
	@Autowired
	OrderReviewDao orderReviewDao;
	
	//이용 후기.
	@Override
	public void reviewList(Model model, int product_id, Pagination_P pagination_p, int page, int range){
		try {
			//total
			pagination_p.setProduct_id(product_id);
			int listCnt = orderReviewDao.total(pagination_p);
			
			// Pagination
			pagination_p.pageInfo(page, range, listCnt);
			List<OrderReviewVo> list=orderReviewDao.selectAll(pagination_p);
			
			model.addAttribute("ReviewTotal",listCnt);
			model.addAttribute("ReviewList",list);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
