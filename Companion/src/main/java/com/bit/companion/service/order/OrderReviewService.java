package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.companion.common.Pagination_P;
import com.bit.companion.model.entity.order.OrderReviewVo;

public interface OrderReviewService {
	//review list
	void reviewList(Model model, int article_id, Pagination_P pagination_p, int page, int range);
	//review detail one view
	void detail(Model model, int article_id);
}
