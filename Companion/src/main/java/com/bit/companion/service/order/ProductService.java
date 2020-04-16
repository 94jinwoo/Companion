package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

public interface ProductService {

	void list(Model model);
	void category(Model model,int category_id);
	void detail(Model model,int product_id);
	
	void productRecommend(Model model,int product_id);

	void Alignment(Model model,int category_id,int displayPost,int postNum);
	void AlignmentOrderBySelling(Model model,int category_id,int displayPost,int postNum);
	void AlignmentOrderByLowPrice(Model model,int category_id,int displayPost,int postNum);
	void AlignmentOrderByHighPrice(Model model,int category_id,int displayPost,int postNum);
	void AlignmentOrderByDate(Model model,int category_id,int displayPost,int postNum);
	
	//countPage
	//상품 총 개수
	int count(Model model,int category_id) throws SQLException, Exception;

	
	//게시물 목록 + 페이징
	List listPage(Model model,int displayPost,int postNum,int category_id) throws Exception;
	
	
}