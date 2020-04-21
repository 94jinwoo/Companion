package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.SessionVo;
import com.bit.companion.model.order.SessionDao;

@Service
public class SessionServiceImpl implements SessionService {

	List<SessionVo> result=null;

	@Autowired
	SessionDao sessionDao;
	
	
	@Override
	public void SessionList(Model model, ArrayList<Object> list) {
		 
		for(int i=0;i<list.size();i++) { 
			list.get(i);
			System.out.println("프로덕트 아이디?? 리스트에 담겨있니??");
		}
			try {  
				result=sessionDao.sessionList(list);
				System.out.println(result.toString());
//				session.setAttribute(,result);
				model.addAttribute("sessionList",result);
			} catch (SQLException e) {
				e.printStackTrace();
			}

	}

}


