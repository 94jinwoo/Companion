package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.companion.model.entity.order.LikeVo;

public interface LikeDao {
//	List<LikeVo> likeClickNum(int product_id, String member_id) throws SQLException;
//	int likeDelete(int product_id, String member_id) throws SQLException;
//	List<LikeVo> productLikeNum(int product_id) throws SQLException;
	List<LikeVo> likeTest() throws SQLException;
	int likeInsert(LikeVo likeVo) throws SQLException;
}
