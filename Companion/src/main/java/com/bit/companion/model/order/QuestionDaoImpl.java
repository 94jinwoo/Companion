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
	
	// insert
	@Override
	public void registReply(OrderQuestionVo orderQuestionVo) throws SQLException {
		sqlSession.insert("orderQuestion.registReply",orderQuestionVo);
	}
	
	// list
	@Override
	public List<OrderQuestionVo> replyList(Pagination_P pagination_p) throws SQLException {
		return sqlSession.selectList("orderQuestion.OrderQuestionList",pagination_p);
	}

	@Override
	public int replyListAllCount(Pagination_P pagination_p) throws SQLException {
		return sqlSession.selectOne("orderQuestion.ReplyListAllCount",pagination_p);
	}

	// detail
	@Override
	public OrderQuestionVo replyDetail(int question_id) throws SQLException {
		return sqlSession.selectOne("orderQuestion.ReplyDetail", question_id);
	}

}
