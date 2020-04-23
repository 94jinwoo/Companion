package com.bit.companion.model.order;

import java.sql.SQLException; 
import java.util.List;

import com.bit.companion.common.Pagination_C;
import com.bit.companion.model.entity.order.ProductVo;

public interface ProductDao {
	// product select info
	List<ProductVo> ProductSelectAll() throws SQLException;
	//product detail page info
	ProductVo ProductDetailOne(int product_id) throws SQLException;
	//product category sort
	List<ProductVo> ProductCategorySelect(int category_id) throws SQLException;
	//product recommend list view
	List<ProductVo> productRecommendList(int product_id) throws SQLException;
	//product recommend list view 2
	List<ProductVo> productRecommendList2(int product_id) throws SQLException;
	// total (paging-review)
	int count(Pagination_C pagination_c) throws Exception;
	// list  (paging-review)
	List<ProductVo> listPage(Pagination_C pagination_c) throws Exception;
}

