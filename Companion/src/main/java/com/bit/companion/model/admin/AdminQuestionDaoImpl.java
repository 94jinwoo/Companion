package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.common.Search;
import com.bit.companion.model.entity.admin.AdminArticleVo;

@Repository
public class AdminQuestionDaoImpl implements AdminQuestionDao{

	@Autowired
	SqlSession sqlSession;

	// question list
	@Override
	public List<AdminArticleVo> selectQuestion(Search search) throws SQLException {
		return sqlSession.selectList("adminQuestion.selectQuestion", search);
	}
	
	// answer list
	@Override
	public List<AdminArticleVo> selectAnswer(Search search) throws SQLException {
		return sqlSession.selectList("adminQuestion.selectAnswer", search);
	}

	// question list total
	@Override
	public int questionTotal(Search search) throws SQLException {
		return sqlSession.selectOne("adminQuestion.questionTotal", search);
	}
	
	// answer list total
	@Override
	public int answerTotal(Search search) throws SQLException {
		return sqlSession.selectOne("adminQuestion.answerTotal", search);
	}
	
	
	
}
