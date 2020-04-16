package com.bit.companion.controller.order;

import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.companion.model.entity.login.MemberVo;
import com.bit.companion.model.entity.order.OrderQuestionVo;
import com.bit.companion.service.order.OrderQuestionService;
import com.bit.companion.service.order.OrderReviewService;
import com.bit.companion.service.order.ProductService;
@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	ProductService productService;
	
	@Autowired
	OrderReviewService orderReviewService;
	
	
	@Autowired
	OrderQuestionService orderQuestionService;
	
	OrderQuestionVo orderQuestionVo;
	
//	String CategoryNUM;
	
	//페이지 정렬용 URL 패턴 메서드
	public void urlPattern(HttpServletRequest request) {
		String url = request.getRequestURI();
		String[] url2 = url.split("/");
		request.setAttribute("trueUrl",url2[4]);
		System.out.println(url2[4]);
	}
	
	//DETAIL PAGE
	@RequestMapping(value = "/order/productDetail",method=RequestMethod.GET)
	public String productDetail(Model model,@RequestParam("idx") int product_id,HttpSession session) throws SQLException {

		
		MemberVo memberVo=(MemberVo)session.getAttribute("memberVo");
		
	if(memberVo==null) {
		
	}else {
		memberVo.setMember_id((memberVo.getMember_id()));
	}
		//이용 후기 리스트 출력
		orderReviewService.orderReviewList(model, product_id);
		
		//상품 상세 페이지 정보 출력.
		productService.detail(model, product_id);	
		
		//상품 추천
		productService.productRecommend(model, product_id);
		
		return "order/productDetail";
	}
	
	/* 답글 입력용 */
	@RequestMapping(value = "/order/productDetail/orderQuestion")
	public String orderQuestion(Model model) {
		System.out.println("답글 입력 메서드 실행.");
		return "order/orderQuestion";
	}
	
	//페이지 개수용.
	//@RequestParam("num") 은 페이지 번호.
	@RequestMapping(value = "/order/productMain",method = RequestMethod.GET)
	public String listPage(Model model,@RequestParam("c") int category_id, @RequestParam("num") int num,HttpServletRequest request) throws Exception {
		logger.debug("페이지 개수 확인용 컨트롤러 작동 확인?");
		OrderPagenation page = new OrderPagenation();
		page.setNum(num);
		page.setCount(productService.count(model, category_id));
		model.addAttribute("pageNum",page.getPageNum());
		model.addAttribute("startPageNum",page.getStartPageNum());
		model.addAttribute("endPageNum",page.getEndPageNum());
		model.addAttribute("prev",page.getPrev());
		model.addAttribute("next",page.getNext());
		model.addAttribute("select",num);
		/*
		 * urlPattern(request);
		 */		productService.listPage(model, page.getDisplayPost(), page.getPostNum(), category_id);
		
		return "order/productMain";
	}
	

	
	  
	///추천순 정렬
	@RequestMapping(value = "/order/productMain/orderByLike",method=RequestMethod.GET)
	public String productOrderByProductLike(Model model,@RequestParam("c") int category_id, @RequestParam("num") int num,HttpServletRequest request) throws Exception {
		OrderPagenation page = new OrderPagenation();
		page.setNum(num);
		page.setCount(productService.count(model,category_id));
		System.out.println("총 상품 갯수 : "+ page.getCount());
		model.addAttribute("pageNum",page.getPageNum());
		model.addAttribute("startPageNum",page.getStartPageNum());
		model.addAttribute("endPageNum",page.getEndPageNum());
		model.addAttribute("prev",page.getPrev());
		model.addAttribute("next",page.getNext());
		model.addAttribute("select",num);
 
		logger.debug("상품 정렬(추천순) 컨트롤러 작동 확인");
		logger.debug("카테고리 아이디 : "+Integer.toString(category_id) );
		logger.debug("jsp 에서 받아오는 NUM 값 : "+Integer.toString(num));
		System.out.println("하단 페이징 번호 pageNum : " + page.getPageNum());
		System.out.println("표시되는 페이지 중 첫번 쨰 번호 startPageNum : " + page.getStartPageNum());
		System.out.println(" 끝나는 번호 endPageNum : "+page.getEndPageNum());
		urlPattern(request);	
		productService.Alignment(model,category_id,page.getDisplayPost(),page.getPostNum());
		
		return "order/productMain";
	}
	
	///판매량 정렬
	@RequestMapping(value = "/order/productMain/orderBySelling",method=RequestMethod.GET)
	public String productOrderBySellingOrder(Model model,@RequestParam("c") int category_id, @RequestParam("num") int num,HttpServletRequest request) throws Exception {
		logger.debug("상품 정렬(판매량순) 컨트롤러 작동 확인");
		logger.debug("카테고리 아이디 : "+Integer.toString(category_id) );
		OrderPagenation page = new OrderPagenation();
		page.setNum(num);
		page.setCount(productService.count(model, category_id));
		model.addAttribute("pageNum",page.getPageNum());
		model.addAttribute("startPageNum",page.getStartPageNum());
		model.addAttribute("endPageNum",page.getEndPageNum());
		model.addAttribute("prev",page.getPrev());
		model.addAttribute("next",page.getNext());
		model.addAttribute("select",num);

		urlPattern(request);
		productService.AlignmentOrderBySelling(model, category_id,page.getDisplayPost(),page.getPostNum());
		
		return "order/productMain";
	}
	//낮은 가격 순 정렬
	@RequestMapping(value = "/order/productMain/orderByLowPrice",method=RequestMethod.GET)
	public String productOrderByLowPrice(Model model,@RequestParam("c") int category_id, @RequestParam("num") int num,HttpServletRequest request) throws Exception {
		logger.debug("상품 정렬(낮은 가격 순) 컨트롤러 작동 확인");
		logger.debug("카테고리 아이디 : "+Integer.toString(category_id) );
		OrderPagenation page = new OrderPagenation();
		page.setNum(num);
		page.setCount(productService.count(model, category_id));
		model.addAttribute("pageNum",page.getPageNum());
		model.addAttribute("startPageNum",page.getStartPageNum());
		model.addAttribute("endPageNum",page.getEndPageNum());
		model.addAttribute("prev",page.getPrev());
		model.addAttribute("next",page.getNext());
		model.addAttribute("select",num);
		urlPattern(request);	
		productService.AlignmentOrderByLowPrice(model, category_id,page.getDisplayPost(),page.getPostNum());
		return "order/productMain";
	}
	
	//높은 가격 순 정렬
	@RequestMapping(value = "/order/productMain/orderByHighPrice",method=RequestMethod.GET)
	public String productOrderByHighPrice(Model model,@RequestParam("c") int category_id, @RequestParam("num") int num,HttpServletRequest request) throws Exception {
		logger.debug("상품 정렬(높은 가격 순) 컨트롤러 작동 확인");
		logger.debug("카테고리 아이디 : "+Integer.toString(category_id) );
		OrderPagenation page = new OrderPagenation();
		page.setNum(num);
		page.setCount(productService.count(model, category_id));
		model.addAttribute("pageNum",page.getPageNum());
		model.addAttribute("startPageNum",page.getStartPageNum());
		model.addAttribute("endPageNum",page.getEndPageNum());
		model.addAttribute("prev",page.getPrev());
		model.addAttribute("next",page.getNext());
		model.addAttribute("select",num);
		urlPattern(request);	
		productService.AlignmentOrderByHighPrice(model, category_id,page.getDisplayPost(),page.getPostNum());
		return "order/productMain";
	}
	
	//등록일 순 정렬
	@RequestMapping(value = "/order/productMain/orderByDate",method=RequestMethod.GET)
	public String productOrderByDate(Model model,@RequestParam("c") int category_id, @RequestParam("num") int num,HttpServletRequest request) throws Exception {
		logger.debug("상품 정렬(등록일 순) 컨트롤러 작동 확인");
		logger.debug("카테고리 아이디 : "+Integer.toString(category_id) );
		OrderPagenation page = new OrderPagenation();
		page.setNum(num);
		page.setCount(productService.count(model, category_id));
		model.addAttribute("pageNum",page.getPageNum());
		model.addAttribute("startPageNum",page.getStartPageNum());
		model.addAttribute("endPageNum",page.getEndPageNum());
		model.addAttribute("prev",page.getPrev());
		model.addAttribute("next",page.getNext());
		model.addAttribute("select",num);
		urlPattern(request);	
		productService.AlignmentOrderByDate(model, category_id,page.getDisplayPost(),page.getPostNum());
		return "order/productMain";
	}
	


}