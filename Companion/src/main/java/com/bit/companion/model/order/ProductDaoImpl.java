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
	
	@Override
	public List<ProductVo> ProductSelectAll() throws SQLException {
		return sqlSession.selectList("product.ProductSelectAll");
	}
 
	//프로덕트 상세페이지
	@Override
	public ProductVo ProductDetailOne(int product_id) throws SQLException {
		return sqlSession.selectOne("product.ProductDetailOne",product_id);
	}

	//상품 카테고리 목록별 출력.
	@Override
	public List<ProductVo> ProductCategorySelect(int category_id) throws SQLException {
		return sqlSession.selectList("product.ProductCategorySelect",category_id);
	}
	
	//상품 추천 목록 출력.
	@Override
	public List<ProductVo> productRecommendList(int product_id) throws SQLException {
		return sqlSession.selectList("ProductRecommendList",product_id);
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
