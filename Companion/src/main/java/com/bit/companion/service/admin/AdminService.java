package com.bit.companion.service.admin;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.admin.AdminNoticeVo;

public interface AdminService {

	// �������� ����Ʈ
	void list(Model model);
	// �������� ��
	void detail(Model model,int article_id);
	// �������� �Է�
	void insert(AdminNoticeVo bean);
	// �������� ����
	void update(AdminNoticeVo bean);
}
