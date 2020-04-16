package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.order.OrderReviewVo;

@Repository
public class OrderReviewDaoImpl implements OrderReviewDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<OrderReviewVo> ReviewList(int product_id) throws SQLException {
		//이용 후기 임.
		return sqlSession.selectList("orderReview.OrderReviewList",product_id);
	}
	
	
	
	
}
