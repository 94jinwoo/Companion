package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.common.Search;
import com.bit.companion.model.entity.admin.AdminArticleVo;

@Repository
public class AdminArticleDaoImpl implements AdminArticleDao {
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;
	
	// notice list - selectAll
	@Override
	public List<AdminArticleVo> selectAll(Search search) throws SQLException {
		return sqlSession.selectList("adminArticle.selectAll",search);
	}

	// notice detail - selectOne
	@Override
	public AdminArticleVo selectOne(AdminArticleVo bean) throws SQLException {
		return sqlSession.selectOne("adminArticle.selectOne",bean);
	}
	
	// notice add - insertOne
	@Override
	public void insertOne(AdminArticleVo bean) throws SQLException {
		sqlSession.insert("adminArticle.insertOne",bean);
	}

	// notice edit - updateOne
	@Override
	public int updateOne(AdminArticleVo bean) throws SQLException {
		return sqlSession.update("adminArticle.updateOne",bean);
	}

	// notice delete - deleteOne
	@Override
	public int deleteOne(AdminArticleVo bean) throws SQLException {
		return sqlSession.delete("adminArticle.deleteOne",bean);
	}

	// notice total - selectTotal
	@Override
	public int selectTotal(Search search) throws SQLException {
		return sqlSession.selectOne("adminArticle.selectTotal", search);
	}

}
