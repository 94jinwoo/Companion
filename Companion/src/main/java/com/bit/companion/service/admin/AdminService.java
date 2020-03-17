package com.bit.companion.service.admin;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.admin.AdminArticleVo;

public interface AdminService {

	// �������� ����Ʈ
	void list(Model model);
	// �������� ��
	void detail(Model model,int article_id);
	// �������� �Է�
	void insert(AdminArticleVo bean);
	// �������� ����
	void update(AdminArticleVo bean);
	// �������� ����
	void delete(AdminArticleVo bean);
}
