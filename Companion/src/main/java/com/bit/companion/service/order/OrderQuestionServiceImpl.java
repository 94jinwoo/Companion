package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.common.Pagination;
import com.bit.companion.common.Pagination_P;
import com.bit.companion.controller.order.OrderPagenation;
import com.bit.companion.model.entity.admin.AdminArticleVo;
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
	public void replyList(Model model, int product_id, Pagination_P pagination_p, int page, int range) throws SQLException {
		System.out.println("문의글 목록/  replyList");
		
		pagination_p.setProduct_id(product_id);
		int listCnt = questionDao.replyListAllCount(pagination_p);
		
		// Pagination
		pagination_p.pageInfo(page, range, listCnt);
		List<OrderQuestionVo> list = questionDao.replyList(pagination_p);
		
		model.addAttribute("ReplyTotal", listCnt);
		model.addAttribute("ReplyList",list);
	}
	
	//문의글 조회
	@Override
	public void detail(Model model, int question_id) throws SQLException {
		model.addAttribute("ReplyDetail",questionDao.replyDetail(question_id));
	}
	
}
