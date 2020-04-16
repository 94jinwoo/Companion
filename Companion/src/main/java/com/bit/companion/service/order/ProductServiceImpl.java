package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.controller.order.OrderPagenation;
import com.bit.companion.model.entity.order.ProductVo;
import com.bit.companion.model.order.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {
	OrderPagenation page = new OrderPagenation();
	int num=1;
	
	
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

	@Override
	public void detail(Model model,int product_id) {
		try {
			productDao.ProductDetailOne(product_id);
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
	
	
	
	//추천순 정렬 나머지 조건도 채울 것.
	@Override
	public void Alignment(Model model,int category_id,int displayPost,int postNum) {
		List<ProductVo> list = null;
		try {
			list=productDao.productAlignmentByLike(category_id,displayPost,postNum);
			model.addAttribute("listPage",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		

		
	}
	//판매량순 정렬
	@Override
	public void AlignmentOrderBySelling(Model model, int category_id,int displayPost,int postNum) {
		List<ProductVo> list;
		try {
			list=productDao.productAlignmentBySellingOrder(category_id,displayPost,postNum);
			model.addAttribute("listPage",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	//낮은 가격 순 정렬
	@Override
	public void AlignmentOrderByLowPrice(Model model, int category_id,int displayPost,int postNum) {
		List<ProductVo> list;
		
		try {
			list=productDao.productAlignmentByLowPrice(category_id,displayPost,postNum);
			model.addAttribute("listPage",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//높은 가격 순
	@Override
	public void AlignmentOrderByHighPrice(Model model, int category_id,int displayPost,int postNum) {
		List<ProductVo> list;
		
		try {
			list=productDao.productAlignmentByHighPrice(category_id,displayPost,postNum);
			model.addAttribute("listPage",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//등록일 순
	@Override
	public void AlignmentOrderByDate(Model model, int category_id,int displayPost,int postNum) {
		List<ProductVo> list;
		
		try {
			list=productDao.productAlignmentByDate(category_id,displayPost,postNum);
			model.addAttribute("listPage",list);
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

	
	//이용후기 목록 출력.
//	@Override
//	public void productReview(Model model,int product_id) {
//		List<ProductVo> ReviewList;
//		System.out.println("productReview service 작동 확인");		
//		System.out.println(product_id);
//		try {
//				ReviewList = productDao.productReview(product_id);
//				model.addAttribute("productReviewList",ReviewList);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//	}

	//4.10
	//상품 총 개수
	@Override
	public int count(Model model, int category_id) throws Exception {
		return productDao.count(category_id);
	}

	//게시물 목록 + 페이징
	@Override
	public List<ProductVo> listPage(Model model,int displayPost, int postNum,int category_id){
		List<ProductVo> list=null;
		System.out.println("LISTPAGE써삐쓰 뜰리나 홖인?");
		try {
			list=productDao.listPage(displayPost, postNum,category_id);
			model.addAttribute("listPage",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}








