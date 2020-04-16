package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.OrderQuestionVo;
import com.bit.companion.model.order.QuestionDao;

@Service
public class OrderQuestionServiceImpl implements OrderQuestionService {

		@Autowired
		QuestionDao questionDao;
	//문의글 등록.
	@Override
	public void registReply(OrderQuestionVo orderQuestionVo) throws SQLException {
		System.out.println("문의글 등록/  OrderQuestionService");
		questionDao.registReply(orderQuestionVo);
			
	}
	//문의글 목록.
	@Override
	public List<OrderQuestionVo> replyList(Model model,int product_id) throws SQLException {
		System.out.println("문의글 목록/  replyList");
		model.addAttribute("ReplyList",questionDao.replyList(product_id));
		return questionDao.replyList(product_id); 
	}

}
