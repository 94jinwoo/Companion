package com.bit.companion.service.admin;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.admin.AdminNoticeVo;

public interface AdminService {

	// �������� ����Ʈ
	void list(Model model);
	// �������� �Է�
	void insert(AdminNoticeVo bean);
}
