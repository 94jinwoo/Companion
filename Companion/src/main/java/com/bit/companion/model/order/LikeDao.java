package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.companion.model.entity.order.LikeVo;

public interface LikeDao {
	List<LikeVo> likeTest() throws SQLException;
	int likeInsert(LikeVo likeVo) throws SQLException;
}
