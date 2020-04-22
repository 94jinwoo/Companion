package com.bit.companion.controller.order;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.companion.common.Pagination;
import com.bit.companion.common.Pagination_P;
import com.bit.companion.common.Search;
import com.bit.companion.model.entity.login.MemberVo;
import com.bit.companion.model.entity.order.OrderQuestionVo;
import com.bit.companion.service.order.OrderQuestionService;

@Controller
public class OrderQuestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderQuestionController.class);
	
	@Autowired
	OrderQuestionService orderQuestionService;
	
	//문의하기 댓글 작성.
	@RequestMapping(value="order/productDetail/question", method=RequestMethod.POST)
	public String registReply(OrderQuestionVo orderQuestionVo,HttpSession session) throws SQLException {
		MemberVo member = (MemberVo)session.getAttribute("memberVo");
		orderQuestionVo.setMember_id(member.getMember_id());
		System.out.println(member.getMember_id());
		//question table insert = 문의글 작성.
		orderQuestionService.registReply(orderQuestionVo);
		return "order/productDetail";
	}
	
	//문의하기
	@RequestMapping(value="order/productDetail/ReplyList",method = RequestMethod.GET)
	public String ReplyList(Model model,@RequestParam("product_id") int product_id 
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range 
			,@ModelAttribute("pagination_p") Pagination_P pagination_p 
			) throws SQLException{
		
		orderQuestionService.replyList(model, product_id, pagination_p,page, range);
		
		return "order/question";
	}
	
	//문의상세
	@RequestMapping(value = "order/productDetail/ReplyDetail", method = RequestMethod.GET)
	public String ReplyDetail(Model model, @RequestParam int question_id) throws SQLException{
		orderQuestionService.detail(model, question_id);
		return "order/questionDetail";
	}
	
}
