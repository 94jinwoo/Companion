package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.OrderReviewVo;

//이용 후기 리스트
public interface OrderReviewService {
	List<OrderReviewVo> orderReviewList(Model model,int product_id);
}
