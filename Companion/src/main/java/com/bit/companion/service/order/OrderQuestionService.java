package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.companion.common.Pagination;
import com.bit.companion.common.Pagination_P;
import com.bit.companion.controller.order.OrderPagenation;
import com.bit.companion.model.entity.order.OrderQuestionVo;

public interface OrderQuestionService {
	void registReply(OrderQuestionVo orderQuestionVo) throws SQLException;
	void replyList(Model model, int product_id, Pagination_P pagination_p, int page, int range) throws SQLException;
	void detail(Model model, int question_id) throws SQLException;
}
