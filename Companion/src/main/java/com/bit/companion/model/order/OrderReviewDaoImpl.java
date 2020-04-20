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

	//list
	@Override
	public List<OrderReviewVo> selectAll( Pagination_P pagination_p) throws SQLException {
		return sqlSession.selectList("orderReview.reviewList",pagination_p);
	}

	//total
	@Override
	public int total(Pagination_P pagination_p) throws SQLException {
		return sqlSession.selectOne("orderReview.reviewTotal",pagination_p);
	}

	//detail
	@Override
	public Object reviewDetail(int article_id) throws SQLException {
		return sqlSession.selectOne("orderReview.reviewDetail", article_id);
	}
	
}
