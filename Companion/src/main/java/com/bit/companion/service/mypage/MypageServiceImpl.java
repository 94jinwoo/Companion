package com.bit.companion.service.mypage;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.companion.model.entity.mypage.MyCartOrderVo;
import com.bit.companion.model.entity.mypage.MyPurchaseListVo;
import com.bit.companion.model.entity.mypage.MyReviewVo;
import com.bit.companion.model.entity.mypage.MypageCartVo;
import com.bit.companion.model.entity.mypage.MypageQuestionVo;
import com.bit.companion.model.entity.mypage.MypageReserveVo;
import com.bit.companion.model.mypage.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao mypageDao;
	
	@Override
	public int pwChange(String pw_change,String id_chk) {
		return mypageDao.pwChange(pw_change,id_chk);
	}

	@Override
	public int telChange(String tel_change, String id_chk) {
		return mypageDao.telChange(tel_change,id_chk);
	}

	@Override
	public int phoneChange(String phone_change, String id_chk) {
		return mypageDao.phoneChange(phone_change,id_chk);
	}

	@Override
	public int emailChange(String email_change, String id_chk) {
		return mypageDao.emailChange(email_change,id_chk);
	}

	@Override
	public int addrChange(String addr1_change, String addr2_change, String addr3_change, String id_chk) {
		return mypageDao.addrChange(addr1_change,addr2_change,addr3_change,id_chk);
	}

	@Override
	public void questionList(HttpSession session) {
		List<MypageQuestionVo> questionList = mypageDao.questionList(session);
		session.setAttribute("questionList", questionList);
	}

	@Override
	public void reserveList(HttpSession session) {
		List<MypageReserveVo> reserveList = mypageDao.reserveList(session);
		session.setAttribute("reserveList", reserveList);
	}

	@Override
	public void cartList(HttpSession session) {
		List<MypageCartVo> cartList=mypageDao.cartList(session);
		session.setAttribute("cartList", cartList);
	}

	@Override
	public int selectDeleteCart(String cart_id, String member_id) {
		return mypageDao.selectDeleteCart(cart_id,member_id);
	}

	@Override
	public int changeOptionCart(String change_option, String cart_id, String member_id) {
		return mypageDao.changeOptionCart(change_option,cart_id,member_id);
	}

	@Override
	public int changeQuantityCart(String change_quantity, String cart_id, String member_id) {
		return mypageDao.changeQuantityCart(change_quantity,cart_id,member_id);
	}

	@Override
	public void insertOrder(MyCartOrderVo bean) {
		mypageDao.insertOrder(bean);
	}

	@Override
	public int checkDeliveryNumber(String delivery_number) {
		return mypageDao.checkDeliveryNumber(delivery_number);
	}

	@Override
	public String findOrder_id(MyCartOrderVo bean) {
		return mypageDao.findOrder_id(bean);
	}

	@Override
	public void insertOrders(MyCartOrderVo bean) {
		mypageDao.insertOrders(bean);
	}

	@Override
	public int deleteOneQuestion(String member_id, String question_id) {
		return mypageDao.deleteOneQuestion(member_id,question_id);
	}

	@Override
	public List purchaseList(String member_id) {
		return mypageDao.purchaseList(member_id);
	}

	@Override
	public List purchaseDetailList(String order_id, Date order_date,String order_state_member,String order_state_id) {
		return mypageDao.purchaseDetailList(order_id,order_date,order_state_member,order_state_id);
	}

	@Override
	public MyPurchaseListVo myPurchaseDetail(String order_id, String member_id) {
		return mypageDao.myPurchaseDetail(order_id,member_id);
	}

	@Override
	public int myAskProductInsert(MypageQuestionVo bean) {
		return mypageDao.myAskProductInsert(bean);
	}

	@Override
	public int myReviewInsert(MyReviewVo bean) {
		return mypageDao.myReviewInsert(bean);
	}

	@Override
	public void insertPayment(MyCartOrderVo bean) {
		mypageDao.insertPayment(bean);
	}

	@Override
	public int confirmPurchase(String member_id, String order_id) {
		return mypageDao.confirmPurchase(member_id,order_id);
	}



}
