package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.companion.common.Pagination_C;

public interface ProductService {

	// today view
	void list(Model model);
	void category(Model model,int category_id);
	void detail(Model model,int product_id);
	
	void productRecommend(Model model,int product_id);
	
	// list
	void listPage(Model model, int category_id,int page, int range, Pagination_C pagination_c) throws Exception;
	
}