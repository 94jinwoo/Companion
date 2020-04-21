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
	// insert
	@Override
	public void registReply(OrderQuestionVo orderQuestionVo) throws SQLException {
		questionDao.registReply(orderQuestionVo);
			
	}
	// list 
	@Override
	public void replyList(Model model, int product_id, Pagination_P pagination_p, int page, int range) throws SQLException {
		
		pagination_p.setProduct_id(product_id);
		pagination_p.setListSize(5);
		int listCnt = questionDao.replyListAllCount(pagination_p);
		
		// Pagination
		pagination_p.pageInfo(page, range, listCnt);
		List<OrderQuestionVo> list = questionDao.replyList(pagination_p);
		
		model.addAttribute("ReplyTotal", listCnt);
		model.addAttribute("ReplyList",list);
	}
	
	// detail
	@Override
	public void detail(Model model, int question_id) throws SQLException {
		model.addAttribute("ReplyDetail",questionDao.replyDetail(question_id));
	}
	
}
