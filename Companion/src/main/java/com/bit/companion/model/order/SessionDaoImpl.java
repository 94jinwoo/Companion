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
	
	
//	@Override
//	public ArrayList<Object> sessionList(int product_id){
//			ArrayList<Object> list=(ArrayList<Object>) sqlSession.selectList("session.sessionList",product_id);
//		return list;
//	}


	@Override
	public List<SessionVo> sessionList(List<Object> list) throws SQLException {
		List<SessionVo> mylist=sqlSession.selectList("session.sessionList",list);
		return mylist; 
	} 

}
