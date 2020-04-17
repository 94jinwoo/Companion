package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.common.Pagination_P;
import com.bit.companion.model.entity.order.OrderReviewVo;

public interface OrderReviewDao {
	public List<OrderReviewVo> selectAll(Pagination_P pagination_p) throws SQLException;
	public int total(Pagination_P pagination_p) throws SQLException;
}
