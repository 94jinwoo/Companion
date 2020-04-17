package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.companion.common.Pagination_P;
import com.bit.companion.model.entity.order.OrderReviewVo;

//이용 후기 리스트
public interface OrderReviewService {
	void reviewList(Model model, int product_id, Pagination_P pagination_p, int page, int range);
}
