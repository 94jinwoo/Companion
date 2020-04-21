package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.companion.model.entity.admin.AdminArticleVo;
import com.bit.companion.model.entity.admin.AdminQuestionVo;

@Service
public class AdminReviewDaoImpl implements AdminReviewDao{
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;

	// Review list - selectAll
	@Override
	public List<AdminArticleVo> selectAll() throws SQLException {
		return sqlSession.selectList("adminReview.selectAll");
	}

	// Review detail - selectOne
	@Override
	public AdminArticleVo selectOne(AdminArticleVo bean) throws SQLException {
		return sqlSession.selectOne("adminReview.selectOne",bean);
	}
	
	// Review delete - deleteOne
	@Override
	public int deleteOne(AdminArticleVo bean) throws SQLException {
		return sqlSession.delete("adminReview.deleteOne",bean);
	}
	
}
