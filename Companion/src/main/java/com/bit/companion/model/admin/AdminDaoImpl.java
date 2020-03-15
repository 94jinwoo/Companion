package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.admin.AdminNoticeVo;

@Repository
public class AdminDaoImpl implements AdminDao {
	Logger log=LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;
	
	// �������� ����Ʈ - selectAll
	@Override
	public List<AdminNoticeVo> selectAll() throws SQLException {
		return sqlSession.selectList("adminNotice.selectAll");
	}

	// �������� �� - selectOne
	@Override
	public AdminNoticeVo selectOne(int article_id) throws SQLException {
		return sqlSession.selectOne("adminNotice.selectOne",article_id);
	}
	
	// �������� �Է� - insertOne
	@Override
	public void insertOne(AdminNoticeVo bean) throws SQLException {
		sqlSession.insert("adminNotice.insertOne",bean);
	}

}
