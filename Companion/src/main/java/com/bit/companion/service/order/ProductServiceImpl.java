package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.common.Pagination_C;
import com.bit.companion.controller.order.OrderPagenation;
import com.bit.companion.model.entity.order.ProductVo;
import com.bit.companion.model.order.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;
	
	@Override
	public void list(Model model) {
		List<ProductVo> list;
		try {
			list = productDao.ProductSelectAll();
			model.addAttribute("productlist",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("null")
	@Override
	public void detail(Model model,int product_id) {
		ProductVo list;
		try {
			list = productDao.ProductDetailOne(product_id);
			model.addAttribute("productDetailOne",productDao.ProductDetailOne(product_id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//상품 추천 목록 출력.
	@Override
	public void productRecommend(Model model, int product_id) {
		List<ProductVo> list;
		try {
			list= productDao.productRecommendList(product_id);
			model.addAttribute("productRecommendList",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//	프로덕트 목록 출력.
	@Override
	public void category(Model model, int category_id) {
		List<ProductVo> list;
		try {
			list = productDao.ProductCategorySelect(category_id);
			model.addAttribute("productCategory",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// list page
	@Override
	public void listPage(Model model, int category_id,int page, int range, Pagination_C pagination_c){
		try {
			pagination_c.setCategory_id(category_id);
			pagination_c.setListSize(12);
			int listCnt= productDao.count(pagination_c);
			pagination_c.pageInfo(page, range, listCnt);
			List<ProductVo> list=productDao.listPage(pagination_c);
			model.addAttribute("listPage",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}








