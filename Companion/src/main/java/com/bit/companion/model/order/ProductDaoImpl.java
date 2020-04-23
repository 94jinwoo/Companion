package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.common.Pagination_C;
import com.bit.companion.model.entity.order.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao{
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;
	
	// product select info
	@Override
	public List<ProductVo> ProductSelectAll() throws SQLException {
		return sqlSession.selectList("product.ProductSelectAll");
	}
 
	//product detail page info
	@Override
	public ProductVo ProductDetailOne(int product_id) throws SQLException {
		return sqlSession.selectOne("product.ProductDetailOne",product_id);
	}

	//product category sort
	@Override
	public List<ProductVo> ProductCategorySelect(int category_id) throws SQLException {
		return sqlSession.selectList("product.ProductCategorySelect",category_id);
	}
	
	//product recommend list view
	@Override
	public List<ProductVo> productRecommendList(int product_id) throws SQLException {
		return sqlSession.selectList("ProductRecommendList",product_id);
	}
	//product recommend list view 2
	@Override
	public List<ProductVo> productRecommendList2(int product_id) throws SQLException {
		return sqlSession.selectList("ProductRecommendList2",product_id);
	}
	
	// total
	@Override
	public int count(Pagination_C pagination_c) throws Exception {
		return sqlSession.selectOne("count",pagination_c);
	}

	// list
	@Override
	public List<ProductVo> listPage(Pagination_C pagination_c) throws Exception {
		return sqlSession.selectList("product.ListPage",pagination_c);
	}
}
