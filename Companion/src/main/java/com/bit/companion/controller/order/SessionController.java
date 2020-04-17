package com.bit.companion.controller.order;

import java.sql.SQLException;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.companion.model.entity.order.SessionVo;
import com.bit.companion.service.order.SessionService;
 
public class SessionController {
	private static final Logger logger = LoggerFactory.getLogger(SessionController.class);
	
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping(value="/common/scrollbar",method=RequestMethod.GET)
	public String sessionListController(Model model,HttpSession session,ServletRequest reqeust) throws SQLException {
		logger.debug("제발");
		
		
		System.out.println("session에 담기나 테스트 합니다!");
		SessionVo sessionVo = null;
		int product_id = (int) session.getAttribute("Session");
		sessionVo.setProduct_id((int)session.getAttribute("Session"));
		sessionService.SessionList(model, product_id);
		
		//상품 조회 목록 세션 불러오기.
//		ArrayList<String> list = (ArrayList)session.getAttribute("ToDayView");
//		if(list==null) {
//			list = new ArrayList<String>();
//			session.setAttribute("sessionList",list);
//			list.add((String) session.getAttribute("ToDayView"));
//		}
//		for(int i=0;i<list.size();i++) {
//			System.out.println("세션 확인하겠다요");
//			list.get(i);
//		}

		return "/common/scrollbar";
	}
	
	
	
	
	
	

}
