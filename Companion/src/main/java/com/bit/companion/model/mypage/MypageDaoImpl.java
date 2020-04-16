package com.bit.companion.model.mypage;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.login.MemberVo;
import com.bit.companion.model.entity.mypage.MyCartOrderVo;
import com.bit.companion.model.entity.mypage.MyPurchaseDetailVo;
import com.bit.companion.model.entity.mypage.MyPurchaseListVo;
import com.bit.companion.model.entity.mypage.MyReviewVo;
import com.bit.companion.model.entity.mypage.MypageCartVo;
import com.bit.companion.model.entity.mypage.MypageQuestionVo;
import com.bit.companion.model.entity.mypage.MypageReserveVo;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int pwChange(String pw_change, String id_chk) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("pw_change", pw_change);
		map.put("id_chk", id_chk);
		return sqlSession.update("mypage.pwChange", map);
	}

	@Override
	public int telChange(String tel_change, String id_chk) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("tel_change", tel_change);
		map.put("id_chk", id_chk);
		return sqlSession.update("mypage.telChange",map);
	}

	@Override
	public int phoneChange(String phone_change, String id_chk) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("phone_change",phone_change);
		map.put("id_chk", id_chk);
		return sqlSession.update("mypage.phoneChange",map);
	}

	@Override
	public int emailChange(String email_change, String id_chk) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("email_change",email_change);
		map.put("id_chk", id_chk);
		return sqlSession.update("mypage.emailChange",map);
	}

	@Override
	public int addrChange(String addr1_change, String addr2_change, String addr3_change, String id_chk) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("addr1_change",addr1_change);
		map.put("addr2_change",addr2_change);
		map.put("addr3_change",addr3_change);
		map.put("id_chk", id_chk);
		return sqlSession.update("mypage.addrChange",map);
	}

	@Override
	public List<MypageQuestionVo> questionList(HttpSession session) {
		MemberVo bean=(MemberVo) session.getAttribute("memberVo");
		String member_id=bean.getMember_id();
		List<MypageQuestionVo> list=sqlSession.selectList("mypage.questionList",member_id);
		MypageQuestionVo bean2=new MypageQuestionVo();
		String product_id="";
		String product_thumb="";
		String product_name="";
		for(int i=0; i<list.size(); i++) {
			bean2=list.get(i);
			product_id=bean2.getProduct_id();
			product_thumb=sqlSession.selectOne("mypage.productThumb",product_id);
			product_name=sqlSession.selectOne("mypage.productName",product_id);
			bean2.setProduct_thumb(product_thumb);
			bean2.setProduct_name(product_name);
		}
		
		return list;
	}

	@Override
	public List<MypageReserveVo> reserveList(HttpSession session) {
		MemberVo bean=(MemberVo) session.getAttribute("memberVo");
		String member_id=bean.getMember_id();
		List<MypageReserveVo> list=sqlSession.selectList("mypage.reserveList",member_id);
		MypageReserveVo bean2=new MypageReserveVo();
		String service_id="";
		String service_name="";
		String reserve_state_id="";
		String reserve_state_name="";
		for(int i=0; i<list.size(); i++) {
			bean2=list.get(i);
			service_id=bean2.getService_id();
			reserve_state_id=bean2.getReserve_state_id();
			service_name=sqlSession.selectOne("mypage.serviceName",service_id);
			reserve_state_name=sqlSession.selectOne("mypage.reserveStateName",reserve_state_id);
			bean2.setService_name(service_name);
			bean2.setReserve_state_name(reserve_state_name);
		}
		return list;
	}

	@Override
	public List<MypageCartVo> cartList(HttpSession session) {
		MemberVo bean=(MemberVo) session.getAttribute("memberVo");
		String member_id=bean.getMember_id();
		List<MypageCartVo> list=sqlSession.selectList("mypage.cartList",member_id);
		MypageCartVo bean2=new MypageCartVo();
		String product_id="";
		String product_name="";
		String product_price="";
		String product_thumb="";
		String product_option1="";
		String product_option2="";
		String product_option3="";
		String product_option4="";
		String product_option5="";
		for(int i=0; i<list.size();i++) {
			bean2=list.get(i);
			product_id=bean2.getProduct_id();
			product_name=sqlSession.selectOne("mypage.productName",product_id);
			product_price=sqlSession.selectOne("mypage.productPrice",product_id);
			product_thumb=sqlSession.selectOne("mypage.productThumb",product_id);
			product_option1=sqlSession.selectOne("mypage.productOption1",product_id);
			product_option2=sqlSession.selectOne("mypage.productOption2",product_id);
			product_option3=sqlSession.selectOne("mypage.productOption3",product_id);
			product_option4=sqlSession.selectOne("mypage.productOption4",product_id);
			product_option5=sqlSession.selectOne("mypage.productOption5",product_id);
			bean2.setProduct_name(product_name);
			bean2.setProduct_price(product_price);
			bean2.setProduct_thumb(product_thumb);
			bean2.setProduct_option1(product_option1);
			bean2.setProduct_option2(product_option2);
			bean2.setProduct_option3(product_option3);
			bean2.setProduct_option4(product_option4);
			bean2.setProduct_option5(product_option5);
		}
		return list;
	}

	@Override
	public int selectDeleteCart(String cart_id, String member_id) {
		HashMap<String,String> cartInfo=new HashMap<>();
		cartInfo.put("cart_id", cart_id);
		cartInfo.put("member_id",member_id);
		return sqlSession.delete("mypage.selectDeleteCart",cartInfo);
	}

	@Override
	public int changeOptionCart(String change_option, String cart_id, String member_id) {
		HashMap<String,String> cartInfo=new HashMap<>();
		cartInfo.put("change_option",change_option);
		cartInfo.put("cart_id", cart_id);
		cartInfo.put("member_id", member_id);
		return sqlSession.update("mypage.changeOptionCart",cartInfo);
	}

	@Override
	public int changeQuantityCart(String change_quantity, String cart_id, String member_id) {
		HashMap<String,String> cartInfo=new HashMap<>();
		cartInfo.put("change_quantity", change_quantity);
		cartInfo.put("cart_id", cart_id);
		cartInfo.put("member_id", member_id);
		return sqlSession.update("mypage.changeQuantityCart",cartInfo);
	}

	@Override
	public void insertOrder(MyCartOrderVo bean) {
		/* insert into order table */
		sqlSession.insert("mypage.insertOrder", bean);
	}

	@Override
	public int checkDeliveryNumber(String delivery_number) {
		return sqlSession.selectOne("mypage.countDeliveryNumber", delivery_number);
	}

	@Override
	public String findOrder_id(MyCartOrderVo bean) {
		HashMap<String,String> orderInfo=new HashMap<>();
		orderInfo.put("member_id", bean.getMember_id());
		orderInfo.put("order_date", bean.getOrder_date());
		orderInfo.put("order_amount", bean.getOrder_amount());
		orderInfo.put("order_name", bean.getOrder_name());
		return sqlSession.selectOne("mypage.findOrder_id",orderInfo);
	}

	@Override
	public void insertOrders(MyCartOrderVo bean) {
		/* insert into order_detail table */
		sqlSession.insert("mypage.insertOrder_detail",bean);
		/* insert into delivery table */
		sqlSession.insert("mypage.insertDelivery",bean);
		/* insert into payment table */
		sqlSession.insert("mypage.insertPayment",bean);
		/* delete from cart */
		HashMap<String,String> cartInfo=new HashMap<>();
		cartInfo.put("member_id", bean.getMember_id());
		cartInfo.put("product_id",bean.getProduct_id());
		cartInfo.put("cart_id", bean.getCart_id());
		sqlSession.delete("mypage.deleteCart", cartInfo);
	}

	@Override
	public int deleteOneQuestion(String member_id, String question_id) {
		HashMap<String,String> questionInfo=new HashMap<>();
		questionInfo.put("member_id", member_id);
		questionInfo.put("question_id", question_id);
		return sqlSession.delete("mypage.deleteOneQuestion", questionInfo);
	}

	@Override
	public List purchaseList(String member_id) {
		List<MyPurchaseListVo> list=(List) sqlSession.selectList("mypage.purchaseList", member_id);
		for(int i=0; i<list.size();i++) {
			MyPurchaseListVo bean=list.get(i);
			String order_state_id=bean.getOrder_state_id();
			String order_state_member=sqlSession.selectOne("mypage.orderStateName",order_state_id);
			bean.setOrder_state_member(order_state_member);
		}
		return list;
	}

	@Override
	public List purchaseDetailList(String order_id,Date order_date,String order_state_member) {
		List<MyPurchaseDetailVo> list=(List) sqlSession.selectList("mypage.purchaseDetailList", order_id);
		for(int i=0; i<list.size();i++) {
			MyPurchaseDetailVo bean=list.get(i);
			String product_id=bean.getProduct_id();
			bean.setProduct_thumb(sqlSession.selectOne("mypage.productThumb",product_id));
			bean.setOrder_date(order_date);
			bean.setOrder_state_member(order_state_member);
			bean.setProduct_name(sqlSession.selectOne("mypage.productName",product_id));
		}
		return list;
	}

	@Override
	public MyPurchaseListVo myPurchaseDetail(String order_id, String member_id) {
		HashMap<String,String> myInfo=new HashMap<>();
		myInfo.put("order_id", order_id);
		myInfo.put("member_id", member_id);
		MyPurchaseListVo bean=sqlSession.selectOne("mypage.myPurchaseDetail", myInfo);
		String order_state_id=bean.getOrder_state_id();
		String order_state_member=sqlSession.selectOne("mypage.orderStateName",order_state_id);
		bean.setOrder_state_member(order_state_member);
		return bean;
	}

	@Override
	public int myAskProductInsert(MypageQuestionVo bean) {
		return sqlSession.insert("mypage.askProuctInsert", bean);
	}

	@Override
	public int myReviewInsert(MyReviewVo bean) {
		return sqlSession.insert("mypage.reviewProductInsert",bean);
	}
	

}
