package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.order.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao{
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;
	
	
	//프로덕트 페이지 목록 출력이지만 지금 안쓰고 있음.
	@Override
	public List<ProductVo> ProductSelectAll() throws SQLException {
		return sqlSession.selectList("product.ProductSelectAll");
	}
 
	
	//프로덕트 상세페이지
	@Override
	public ProductVo ProductDetailOne(int product_id) throws SQLException {
		return sqlSession.selectOne("product.ProductDetailOne",product_id);
	}
	
	//이용후기 목록 출력
//	@Override
//	public List<ProductVo> productReview(int product_id) throws SQLException {
//		System.out.println("product_Dao 실행 중...");
//		return sqlSession.selectList("product.ProductReview",product_id);
//	}

	//상품 카테고리 목록별 출력.
	@Override
	public List<ProductVo> ProductCategorySelect(int category_id) throws SQLException {
		return sqlSession.selectList("product.ProductCategorySelect",category_id);
	}
	
	//정렬 추천순 출력.
	@Override
	public List<ProductVo> productAlignmentByLike(int category_id,int displayPost,int postNum) throws SQLException{
		HashMap data = new HashMap();
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("category_id",category_id);
		return sqlSession.selectList("product.productOrderByProductLike",data);
	}

//정렬 판매량 순 
	@Override
	public List<ProductVo> productAlignmentBySellingOrder(int category_id,int displayPost,int postNum) throws SQLException {
		HashMap data = new HashMap();
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("category_id",category_id);
		return sqlSession.selectList("product.productOrderBySellingOrder",data);
	}

//정렬 낮은 가격 순
	@Override
	public List<ProductVo> productAlignmentByLowPrice(int category_id,int displayPost,int postNum) throws SQLException {
		HashMap data = new HashMap();
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("category_id",category_id);
		return sqlSession.selectList("productOrderByLowPrice",data);
	}

// 정렬 높은 가격 순
	@Override
	public List<ProductVo> productAlignmentByHighPrice(int category_id,int displayPost,int postNum) throws SQLException {
		HashMap data = new HashMap();
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("category_id",category_id);
		return sqlSession.selectList("productOrderByHighPrice",data);
	}

// 정렬 등록일 순
	@Override
	public List<ProductVo> productAlignmentByDate(int category_id,int displayPost,int postNum) throws SQLException {
		HashMap data = new HashMap();
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("category_id",category_id);
		return sqlSession.selectList("productOrderByDate",data);
	}

	
	//상품 추천 목록 출력.
	@Override
	public List<ProductVo> productRecommendList(int product_id) throws SQLException {
		return sqlSession.selectList("ProductRecommendList",product_id);
	}
	
	//4.10
	//countList
	//상품 총 갯수
	@Override
	public int count(int category_id) throws Exception {
		return sqlSession.selectOne("count",category_id);
	}

	//게시물 목록 + 페이징
	@Override
	public List<ProductVo> listPage(int displayPost, int postNum,int category_id) throws Exception {
		
		HashMap data = new HashMap();
		
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("category_id",category_id);
		return sqlSession.selectList("product.ListPage",data);
	}
	
}
