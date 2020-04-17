package com.bit.companion.controller.order;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.companion.common.Pagination_P;
import com.bit.companion.model.entity.order.OrderQuestionVo;
import com.bit.companion.model.entity.order.OrderReviewVo;
import com.bit.companion.service.order.OrderQuestionService;
import com.bit.companion.service.order.OrderReviewService;

@Controller
public class OrderReviewController {
	private static final Logger logger = LoggerFactory.getLogger(OrderQuestionController.class);
	
	@Autowired
	OrderReviewService orderReviewService;
	
	// 이용후기 (ARTICLE) TABLE LIST
		@RequestMapping(value="order/productDetail/ReviewList",method = RequestMethod.GET)
		public String ReplyList(Model model,@RequestParam("product_id") int product_id 
				, @RequestParam(required = false, defaultValue = "1") int page
				, @RequestParam(required = false, defaultValue = "1") int range 
				,@ModelAttribute("pagination_p") Pagination_P pagination_p 
				) throws SQLException{
			
			orderReviewService.reviewList(model, product_id, pagination_p,page, range);
			
			return "order/review";
		}
}
