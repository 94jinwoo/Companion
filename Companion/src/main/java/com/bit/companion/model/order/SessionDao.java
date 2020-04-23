package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bit.companion.model.entity.order.SessionVo;

public interface SessionDao {
	//session list (TODAY VIEW)
	public List<SessionVo> sessionList(List<Object> list) throws SQLException;
} 
