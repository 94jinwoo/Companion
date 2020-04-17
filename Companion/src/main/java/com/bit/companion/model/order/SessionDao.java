package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.model.entity.order.SessionVo;

public interface SessionDao {
	public List<SessionVo> sessionList(int product_id) throws SQLException;
}
