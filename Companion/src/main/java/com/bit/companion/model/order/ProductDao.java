package com.bit.companion.model.order;

import java.sql.SQLException; 
import java.util.List;

import com.bit.companion.model.entity.order.ProductVo;

public interface ProductDao {
	List<ProductVo> ProductSelectAll() throws SQLException;
	ProductVo ProductDetailOne(int product_id) throws SQLException;
	List<ProductVo> ProductCategorySelect(int category_id) throws SQLException;
	/*
	 * List<ProductVo> ProductCategorySelect(int category_id) throws SQLException;
	 */ 
//	List<ProductVo> productReview(int product_id) throws SQLException;
	List<ProductVo> productAlignmentByLike(int category_id,int displayPost,int postNum) throws SQLException;
	List<ProductVo> productAlignmentBySellingOrder(int category_id,int displayPost,int postNum) throws SQLException;
	List<ProductVo> productAlignmentByLowPrice(int category_id,int displayPost,int postNum) throws SQLException;
	List<ProductVo> productAlignmentByHighPrice(int category_id,int displayPost,int postNum) throws SQLException;
	List<ProductVo> productAlignmentByDate(int category_id,int displayPost,int postNum) throws SQLException;
	List<ProductVo> productRecommendList(int product_id) throws SQLException;
	
	//페이징용
	//상품 총 개수
	int count(int category_id) throws Exception;

	
	//게시물 목록 + 페이징
	List<ProductVo> listPage(int displayPost,int postNum,int category_id) throws Exception;
}

