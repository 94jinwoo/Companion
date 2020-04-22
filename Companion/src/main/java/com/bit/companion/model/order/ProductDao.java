package com.bit.companion.model.order;

import java.sql.SQLException; 
import java.util.List;

import com.bit.companion.common.Pagination_C;
import com.bit.companion.model.entity.order.ProductVo;

public interface ProductDao {
	List<ProductVo> ProductSelectAll() throws SQLException;
	ProductVo ProductDetailOne(int product_id) throws SQLException;
	List<ProductVo> ProductCategorySelect(int category_id) throws SQLException;
	List<ProductVo> productRecommendList(int product_id) throws SQLException;
	List<ProductVo> productRecommendList2(int product_id) throws SQLException;
	
	// total
	int count(Pagination_C pagination_c) throws Exception;

	// list
	List<ProductVo> listPage(Pagination_C pagination_c) throws Exception;
}

