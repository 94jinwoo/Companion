package com.bit.companion.controller.order;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.companion.model.entity.order.OrderQuestionVo;
import com.bit.companion.model.entity.order.OrderReviewVo;
import com.bit.companion.service.order.OrderQuestionService;
import com.bit.companion.service.order.OrderReviewService;

@Controller
public class OrderReviewController {
	private static final Logger logger = LoggerFactory.getLogger(OrderQuestionController.class);
	
	@Autowired
	OrderQuestionService orderQuestionService;
	
	@Autowired
	OrderReviewService orderReviewService;
	
	
	// 이용후기 (ARTICLE) TABLE LIST
		@ResponseBody
		@RequestMapping(value="order/productDetail/REVIEW",method = RequestMethod.GET)
		public List<OrderReviewVo> getReplyList(Model model,@RequestParam("idx") int product_id) throws SQLException{
			logger.debug("order/productDetail/Review  Controller call...");
			
//			List<OrderQuestionVo> reply = orderQuestionService.replyList(null, product_id);
			List<OrderReviewVo> reply = orderReviewService.orderReviewList(model, product_id);
			
			
			return reply;
		}
	
	
}
