package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.admin.AdminOrderDao;
import com.bit.companion.model.entity.admin.AdminOrderDetailVo;
import com.bit.companion.model.entity.admin.AdminOrderVo;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	@Autowired
	AdminOrderDao adminOrderDao;
	
	@Override
	public void list(Model model) {
		List<AdminOrderVo> list;
		try {
			list = adminOrderDao.selectAll();
			model.addAttribute("list",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void detail(Model model, int order_id) {
		AdminOrderVo bean;
		List<AdminOrderDetailVo> list;
		try {
			bean = adminOrderDao.selectOne(order_id);
			list = adminOrderDao.selectOneDetail(order_id);
			
			model.addAttribute("list",list);
			model.addAttribute("bean",bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void release(int order_id) {
		try {
			adminOrderDao.updateRelease(order_id); // 출고
			adminOrderDao.updateDelivering(order_id); // 배송중
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void cancle(int order_id) {
		try {
			adminOrderDao.updateCancle(order_id); // 주문취소
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delivery(int order_id) {
		try {
			adminOrderDao.updateAdminDelivery(order_id);
			adminOrderDao.updateDelivery(order_id); // 배송완료
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void releaseDone(int order_id) {
		try {
			adminOrderDao.updateReleaseDone(order_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
