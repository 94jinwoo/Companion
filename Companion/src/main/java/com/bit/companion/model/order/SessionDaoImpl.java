package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.order.SessionVo;


@Repository
public class SessionDaoImpl implements SessionDao {

	@Autowired
	SqlSession sqlSession;
	
	//session list (TODAY VIEW)
	@Override
	public List<SessionVo> sessionList(List<Object> list) throws SQLException {
		List<SessionVo> mylist2=new ArrayList<>();;
		for(int i=0; i<list.size(); i++) {
			SessionVo bean=sqlSession.selectOne("session.sessionList",list.get(i));
			mylist2.add(bean);
		}
		return mylist2; 
	} 

}
