package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.model.entity.admin.AdminArticleVo;
import com.bit.companion.model.entity.admin.AdminQuestionVo;

public interface AdminReviewDao {

	// Review list
	List<AdminArticleVo> selectAll() throws SQLException;
	
	// Review detail
	AdminArticleVo selectOne(AdminArticleVo bean) throws SQLException;

	// Review delete
	int deleteOne(AdminArticleVo bean) throws SQLException;
}
