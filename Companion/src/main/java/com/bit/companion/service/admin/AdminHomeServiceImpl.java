package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.common.ChartDate;
import com.bit.companion.controller.admin.AdminHomeController;
import com.bit.companion.model.admin.AdminHomeDao;
import com.bit.companion.model.entity.admin.AdminPaymentVo;
import com.bit.companion.model.entity.order.ProductVo;

@Service
public class AdminHomeServiceImpl implements AdminHomeService {
	private static final Logger log=LoggerFactory.getLogger(AdminHomeController.class);

	@Autowired
	AdminHomeDao adminHomeDao;
	
	@Override
	public void list(Model model) {
		// date object
		ChartDate chartDate = new ChartDate();
		chartDate.chartDate();
		model.addAttribute("chartDate", chartDate);
		
		try {
			// DataTable
			List<ProductVo> list = adminHomeDao.selectProduct(chartDate);
			model.addAttribute("list", list);
			
			// sales(day)
			AdminPaymentVo todaySum = adminHomeDao.selectToday(chartDate);
			AdminPaymentVo today_1Sum = adminHomeDao.selectToday_1(chartDate);
			AdminPaymentVo today_2Sum = adminHomeDao.selectToday_2(chartDate);
			AdminPaymentVo today_3Sum = adminHomeDao.selectToday_3(chartDate);
			AdminPaymentVo today_4Sum = adminHomeDao.selectToday_4(chartDate);
			AdminPaymentVo today_5Sum = adminHomeDao.selectToday_5(chartDate);
			AdminPaymentVo today_6Sum = adminHomeDao.selectToday_6(chartDate);
			model.addAttribute("todaySum",todaySum);
			model.addAttribute("today_1Sum",today_1Sum);
			model.addAttribute("today_2Sum",today_2Sum);
			model.addAttribute("today_3Sum",today_3Sum);
			model.addAttribute("today_4Sum",today_4Sum);
			model.addAttribute("today_5Sum",today_5Sum);
			model.addAttribute("today_6Sum",today_6Sum);
			
			// sales(month)
			AdminPaymentVo monthSum = adminHomeDao.selectMonth(chartDate);
			AdminPaymentVo month_1Sum = adminHomeDao.selectMonth_1(chartDate);
			AdminPaymentVo month_2Sum = adminHomeDao.selectMonth_2(chartDate);
			AdminPaymentVo month_3Sum = adminHomeDao.selectMonth_3(chartDate);
			AdminPaymentVo month_4Sum = adminHomeDao.selectMonth_4(chartDate);
			AdminPaymentVo month_5Sum = adminHomeDao.selectMonth_5(chartDate);
			AdminPaymentVo month_6Sum = adminHomeDao.selectMonth_6(chartDate);
			model.addAttribute("monthSum", monthSum);
			model.addAttribute("month_1Sum", month_1Sum);
			model.addAttribute("month_2Sum", month_2Sum);
			model.addAttribute("month_3Sum", month_3Sum);
			model.addAttribute("month_4Sum", month_4Sum);
			model.addAttribute("month_5Sum", month_5Sum);
			model.addAttribute("month_6Sum", month_6Sum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
