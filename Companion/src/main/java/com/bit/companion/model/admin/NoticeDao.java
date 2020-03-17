package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.model.entity.admin.AdminNoticeVo;

public interface AdminDao {

	// �������� ����Ʈ
	List<AdminNoticeVo> selectAll() throws SQLException;
	
	// �������� ��
	AdminNoticeVo selectOne(int article_id) throws SQLException;;
	
	// �������� �Է�
	void insertOne(AdminNoticeVo bean) throws SQLException;

	// �������� ����
	int updateOne(AdminNoticeVo bean) throws SQLException;

	// �������� ����
	int deleteOne(AdminNoticeVo bean) throws SQLException;
}
