package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.OrderQuestionVo;

public interface OrderQuestionService {
	void registReply(OrderQuestionVo orderQuestionVo) throws SQLException;
	List<OrderQuestionVo> replyList(Model model,int product_id) throws SQLException;
}
