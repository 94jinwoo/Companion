package com.bit.companion.model.order;

import java.util.Enumeration;
import java.util.List;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.order.SessionVo;


@Repository
public class SessionDaoImpl implements SessionDao {

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<SessionVo> sessionList(int product_id){
		
			List<SessionVo> list=sqlSession.selectList("session.sessionList",product_id);
		return list;
	}

}
