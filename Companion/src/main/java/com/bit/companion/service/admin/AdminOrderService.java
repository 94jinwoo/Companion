package com.bit.companion.service.admin;

import org.springframework.ui.Model;

public interface AdminOrderService {
	void list(Model model);

	void detail(Model model, int order_id);

	void release(int order_id);

	void cancel(int order_id);

	void delivery(int order_id);

	void releaseDone(int order_id);

	void purchase(int order_id);

	void exchange(int order_id);

	void orderReturn(int order_id);
}
