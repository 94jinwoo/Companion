package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.companion.common.Search;
import com.bit.companion.model.admin.AdminArticleDao;
import com.bit.companion.model.entity.admin.AdminArticleVo;

@Service
public class AdminArticleServiceImpl implements AdminArticleService {
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	AdminArticleDao adminArticleDao;
	
	// article list - selectAll
	@Override
	public void list(Model model, int page, int range, String searchType, String keyword, Search search, int board_id) {
		try {
			// board_id
			search.setBoard_id(board_id);
			
			// Total list Count
			int listCnt = adminArticleDao.selectTotal(search);
			
			// Pagination
			search.setSearchType(searchType);
			search.setKeyword(keyword);
			search.pageInfo(page, range, listCnt);
			
			List<AdminArticleVo> list = adminArticleDao.selectAll(search);
			
			model.addAttribute("total", listCnt);
			model.addAttribute("search",search);
			model.addAttribute("adminArticleList",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// article detail - selectOne
	@Override
	public void detail(Model model, AdminArticleVo bean, int board_id, Search search) {
		try {
			// board_id
			bean.setBoard_id(board_id);
			
			model.addAttribute("search",search);
			model.addAttribute("adminArticleOne", adminArticleDao.selectOne(bean));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// article add - insertOne
	@Transactional
	@Override
	public void insert(AdminArticleVo bean, int board_id) {
		try {
			// board_id
			bean.setBoard_id(board_id);
			
			adminArticleDao.insertOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// article edit - updateOne
	@Transactional
	@Override
	public void update(AdminArticleVo bean, int board_id, Search search, RedirectAttributes rttr) {
		try {
			// board_id
			bean.setBoard_id(board_id);
			
			// search keep
			rttr.addAttribute("page", search.getPage());
			rttr.addAttribute("range", search.getRange());
			rttr.addAttribute("searchType", search.getSearchType());
			rttr.addAttribute("keyword", search.getKeyword());
			
			adminArticleDao.updateOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// article delete - deleteOne
	@Transactional
	@Override
	public void delete(AdminArticleVo bean, int board_id, Search search, RedirectAttributes rttr) {
		try {
			// board_id
			bean.setBoard_id(board_id);
			
			// search keep
			rttr.addAttribute("page", search.getPage());
			rttr.addAttribute("range", search.getRange());
			rttr.addAttribute("searchType", search.getSearchType());
			rttr.addAttribute("keyword", search.getKeyword());
			
			adminArticleDao.deleteOne(bean);
		} catch (SQLException e) {
		}
	}

}
