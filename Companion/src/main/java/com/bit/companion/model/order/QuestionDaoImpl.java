package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.order.OrderQuestionVo;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	SqlSession sqlSession;
	
	//문의글 등록.
	@Override
	public void registReply(OrderQuestionVo orderQuestionVo) throws SQLException {
		System.out.println("registReply DAO 실행.");
		sqlSession.insert("orderQuestion.registReply",orderQuestionVo);
	}
	
	//문의글 목록.
	@Override
	public List<OrderQuestionVo> replyList(int product_id) throws SQLException {
		System.out.println("replyList DAO 실행.");
		//question table 셀렉트. 문의글 목록 전부 불러오기 실행.
		return sqlSession.selectList("orderQuestion.OrderQuestionList",product_id);
	}

}
