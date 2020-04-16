package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.order.OrderQuestionVo;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	SqlSession sqlSession;
	
	//문의글 등록.
	@Override
	public void registReply(OrderQuestionVo orderQuestionVo) throws SQLException {
		System.out.println("registReply DAO 실행.");
		sqlSession.insert("orderQuestion.registReply",orderQuestionVo);
	}
	
	//문의글 목록.
	@Override
	public List<OrderQuestionVo> replyList(int product_id,int displayPost,int postNum) throws SQLException {
		System.out.println("replyList DAO 실행.");
		//question table 셀렉트. 문의글 목록 전부 불러오기 실행.
		HashMap data = new HashMap();
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("product_id",product_id);
		return sqlSession.selectList("orderQuestion.OrderQuestionList",data);
	}

	@Override
	public int replyListAllCount(int product_id) throws SQLException {
		System.out.println("모든 문의글 개수 파악합니다.");
		return sqlSession.selectOne("orderQuestion.ReplyListAllCount",product_id);
	}

}
