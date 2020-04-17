package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.common.Pagination_P;
import com.bit.companion.model.entity.order.OrderReviewVo;

@Repository
public class OrderReviewDaoImpl implements OrderReviewDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<OrderReviewVo> selectAll( Pagination_P pagination_p) throws SQLException {
		//이용 후기
		return sqlSession.selectList("orderReview.reviewList",pagination_p);
	}

	//총 게시글
	@Override
	public int total(Pagination_P pagination_p) throws SQLException {
		return sqlSession.selectOne("orderReview.reviewTotal",pagination_p);
	}
	
}
