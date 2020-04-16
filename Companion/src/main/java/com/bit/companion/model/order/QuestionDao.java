package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.model.entity.order.OrderQuestionVo;

public interface QuestionDao {
	public void registReply(OrderQuestionVo orderQuestionVo) throws SQLException;
	public List<OrderQuestionVo> replyList(int product_id,int displayPost,int postNum) throws SQLException;
	public int replyListAllCount(int product_id) throws SQLException;
}
