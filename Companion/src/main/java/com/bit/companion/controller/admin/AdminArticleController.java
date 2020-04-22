package com.bit.companion.controller.admin;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.companion.common.Search;
import com.bit.companion.model.entity.admin.AdminArticleVo;
import com.bit.companion.service.admin.AdminArticleService;
import com.bit.companion.util.UploadFileUtils;

@Controller
@RequestMapping(value = "/admin/")
public class AdminArticleController {

	private static final Logger logger=LoggerFactory.getLogger(AdminArticleController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	/* private String uploadPath; */
	
	@Autowired
	AdminArticleService adminNoticeService;

	// board name
	public String checkBoardName(String url) {
		int idx=url.indexOf("_");
		return url.substring(7, idx);
	}
	// board id 
	public int checkBoardId(String boardName) {
		if(boardName.contains("notice")) {
			return 0;
		} else if (boardName.contains("event")) {
			return 1;
		} else if (boardName.contains("faq")) {
			return 2;
		}
		return 0;
	}
	
	// article list - get 
	@RequestMapping(value = {"notice_list", "event_list", "faq_list"}, method = RequestMethod.GET)
	public String noticeList(Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range
			,@RequestParam(required = false, defaultValue = "all") String searchType
			,@RequestParam(required = false) String keyword
			,@ModelAttribute("search") Search search, HttpServletRequest req) {
		
		// board_id 
		String board_name=checkBoardName(req.getServletPath());
		int board_id=checkBoardId(board_name);
		
		adminNoticeService.list(model, page, range, searchType, keyword, search, board_id);
		logger.info("get "+board_name+" list");
		return "admin/"+board_name+"_list";
	}
	
	// article detail - get
	@RequestMapping(value = {"notice_detail", "event_detail", "faq_detail"}, method = RequestMethod.GET)
	public String noticeDetail(Model model, @ModelAttribute AdminArticleVo bean, @ModelAttribute("search") Search search, HttpServletRequest req) {
		
		// board_id 
		String board_name=checkBoardName(req.getServletPath());
		int board_id=checkBoardId(board_name);
		
		adminNoticeService.detail(model, bean, board_id, search);
		logger.info("get "+board_name+" detail");
		return "admin/"+board_name+"_detail";
	}
	
	// article add - get
	@RequestMapping(value = {"notice_add", "event_add", "faq_add"}, method = RequestMethod.GET)
	public String noticeAdd(HttpServletRequest req) {
		
		// board_name
		String board_name=checkBoardName(req.getServletPath());
		
		logger.info("get "+board_name+" add");
		return "admin/"+board_name+"_add";
	}
	
	// article add - post
	@RequestMapping(value = {"notice_add", "event_add", "faq_add"}, method = RequestMethod.POST)
	public String noticeAdd(@ModelAttribute AdminArticleVo bean, MultipartFile file ,HttpServletRequest req) throws IOException, Exception {
		// board_id 
		String board_name=checkBoardName(req.getServletPath());
		int board_id=checkBoardId(board_name);
		/* uploadPath = req.getSession().getServletContext().getRealPath(""); */
		if (board_id == 0 || board_id==1) {
			// File Upload
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;
			
			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				bean.setArticle_image(File.separator+"imgUpload"+ymdPath+File.separator+fileName);
				bean.setArticle_thumb(File.separator+"imgUpload"+ymdPath+File.separator+"s"+File.separator+"s_"+fileName);
			} else {
				// null img
				fileName = "/images/null.png";
				bean.setArticle_image(fileName);
				bean.setArticle_thumb(fileName);
			}
		}
		
		adminNoticeService.insert(bean, board_id);
		logger.info("post "+board_name+" add");
		return "redirect:"+board_name+"_list";
	}
	
	// article edit - get
	@RequestMapping(value = {"notice_edit", "event_edit", "faq_edit"}, method = RequestMethod.GET)
	public String noticeEdit(Model model, @ModelAttribute AdminArticleVo bean, @ModelAttribute("search") Search search, HttpServletRequest req) {
		
		// board_id 
		String board_name=checkBoardName(req.getServletPath());
		int board_id=checkBoardId(board_name);
		
		adminNoticeService.detail(model, bean, board_id, search);
		logger.info("get "+board_name+" edit");
		return "admin/"+board_name+"_edit";
	}
	
	// article edit - post
	@RequestMapping(value = {"notice_edit", "event_edit", "faq_edit"}, method = RequestMethod.POST)
	public String noticeEdit(@ModelAttribute AdminArticleVo bean, @RequestParam int article_id,MultipartFile file, HttpServletRequest req
			, @ModelAttribute("search") Search search, RedirectAttributes rttr) throws IOException, Exception {
		// board_id 
		String board_name=checkBoardName(req.getServletPath());
		int board_id=checkBoardId(board_name);
		
		if(board_id != 2) {
			
		// new file check
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // old file delete
		  new File(uploadPath + req.getParameter("article_image")).delete();
		  new File(uploadPath + req.getParameter("article_thumb")).delete();
		  
		  // new file upload
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  bean.setArticle_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  bean.setArticle_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  
		  // old file keep
		  bean.setArticle_image(req.getParameter("article_image"));
		  bean.setArticle_thumb(req.getParameter("article_thumb"));
		 }
		}
		 
		adminNoticeService.update(bean, board_id, search, rttr);
		logger.info("post "+board_name+" edit");
		return "redirect:/admin/"+board_name+"_detail?article_id="+bean.getArticle_id();
	}
	// article delete - post
	@RequestMapping(value = {"notice_delete", "event_delete", "faq_delete"}, method = RequestMethod.POST)
	public String noticeDelete(@ModelAttribute AdminArticleVo bean, HttpServletRequest req,
			@ModelAttribute("search") Search search, RedirectAttributes rttr) {
		// board_id 
		String board_name=checkBoardName(req.getServletPath());
		int board_id=checkBoardId(board_name);
		adminNoticeService.delete(bean, board_id, search, rttr);
		logger.info("post "+board_name+" delete");
		
		return "redirect:/admin/"+board_name+"_list";
	}
	
}

