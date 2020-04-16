package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.model.entity.order.OrderReviewVo;

public interface OrderReviewDao {
	public List<OrderReviewVo> ReviewList(int product_id) throws SQLException;

}
