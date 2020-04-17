package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.common.Pagination;
import com.bit.companion.common.Pagination_P;
import com.bit.companion.controller.order.OrderPagenation;
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
	public List<OrderQuestionVo> replyList(Pagination_P pagination_p) throws SQLException {
		System.out.println("replyList DAO 실행.");
		return sqlSession.selectList("orderQuestion.OrderQuestionList",pagination_p);
	}

	@Override
	public int replyListAllCount(Pagination_P pagination_p) throws SQLException {
		System.out.println("모든 문의글 개수 파악합니다.");
		return sqlSession.selectOne("orderQuestion.ReplyListAllCount",pagination_p);
	}

	//문의글 조회
	@Override
	public OrderQuestionVo replyDetail(int question_id) throws SQLException {
		return sqlSession.selectOne("orderQuestion.ReplyDetail", question_id);
	}

}
