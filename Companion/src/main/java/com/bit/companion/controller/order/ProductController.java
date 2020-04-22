package com.bit.companion.controller.order;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.bit.companion.common.Pagination_C;
import com.bit.companion.model.entity.login.MemberVo;
import com.bit.companion.model.entity.order.OrderQuestionVo;
import com.bit.companion.service.order.OrderQuestionService;
import com.bit.companion.service.order.OrderReviewService;
import com.bit.companion.service.order.ProductService;
import com.bit.companion.service.order.SessionService;
@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	//조회목록용 리스트
	static ArrayList<Object> list = new ArrayList<Object>();
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	OrderReviewService orderReviewService;
	
	@Autowired
	OrderQuestionService orderQuestionService;
	
	OrderQuestionVo orderQuestionVo;
	

	// DETAIL PAGE
	@RequestMapping(value = "/order/productDetail",method=RequestMethod.GET)
	public String productDetail(Model model,@RequestParam("idx") int product_id,HttpSession session,ServletRequest request,HttpServletResponse response) throws SQLException {
		MemberVo memberVo=(MemberVo)session.getAttribute("memberVo");
	
		request.setAttribute("Product_id",product_id);
		
		//멤버
		if(memberVo==null) {

		}else {
			memberVo.setMember_id((memberVo.getMember_id()));
		}

		//상품 상세 페이지 정보 출력.
		productService.detail(model, product_id);	
		
		//상품 추천
		productService.productRecommend(model, product_id);
		
//		세션
		logger.info(list.toString()+"");
		if(list.size() != 0) {
			
			if(list.size()>2) {
				int i=0;
				do {
					if(list.get(i).equals(product_id)) {
						i++;
						break;
					}else {
						i++;
						list.add(0, product_id);;
						list.remove(3);
						break;
					}
				} while (i<3);
				i=0;
			}else {
				int i=0;
				do {
					if(list.get(i).equals(product_id)) {
						i++;
						break;
					}else {
						i++;
						list.add(0,product_id);
						break;
					}
				} while (i<3);
				i=0;
			}
			if(list!=null) {
				sessionService.SessionList(model,list); 
			}
		} else {
			list.add(0,product_id);
			sessionService.SessionList(model,list);
		}
		logger.info(list.get(0)+" @");
		return "order/productDetail";
	}
	
	// question insert
	@RequestMapping(value = "/order/productDetail/orderQuestion")
	public String orderQuestion(Model model) {
		return "order/orderQuestion";
	}
	
	// list page
	@RequestMapping(value = "/order/productMain",method = RequestMethod.GET)
	public String listPage(Model model,@RequestParam("category_id") int category_id
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range 
			, @RequestParam(required = false, defaultValue = "date") String sort 
			, @ModelAttribute("pagination_c") Pagination_C pagination_c
			) throws Exception {
		
		
		sessionService.SessionList(model,list); 
		pagination_c.setSort(sort);
		productService.listPage(model, category_id, page, range, pagination_c);
		
		return "order/productMain";
	}

}