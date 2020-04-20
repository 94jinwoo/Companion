package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.SessionVo;
import com.bit.companion.model.order.SessionDao;

@Service
public class SessionServiceImpl implements SessionService {

	@Autowired
	SessionDao sessionDao;
	
	
	@Override
	public void SessionList(Model model,int product_id) {
		Session session;
		System.out.println("sessionList SERVICE RUN......");
		
		 
		
		
		List<SessionVo> list = null;
		try {
			list=sessionDao.sessionList(product_id);
			model.addAttribute("sessionList",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
	}
}


