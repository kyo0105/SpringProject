package com.domino.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.domino.domain.EmpVO;
import com.domino.domain.NoticeVO;
import com.domino.domain.PageBlock;
import com.domino.service.NoticePagingService;
import com.domino.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {
	
	private final NoticeService noticeService;
	private final NoticePagingService noticePagingService;
	
	@GetMapping("/newsList")
	public void noticeList(@RequestParam("type") String type
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, Model model 
							) {
		
		log.info("공지사항 목록 페이지 - get"); 
		
		List<NoticeVO> list = null;
		PageBlock pageBlock = null;
				
		list = noticeService.selectList(type, currentPage, 5);
		pageBlock = noticePagingService.paging(type, currentPage, 5);					
		
		model.addAttribute("list", list);
		model.addAttribute("pageBlock", pageBlock);
	}
	
	@PostMapping("/newsList")
	public void noticeList(@RequestParam("type") String type
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value = "searchCondition", required = false) String searchCondition
							, @RequestParam(value = "fSearchCondition", required = false) String fSearchCondition
							, @RequestParam(value = "searchWord", required = false) String searchWord
							, @RequestParam(value = "fSearchWord", required = false) String fSearchWord
							, Model model 
							) {
		
		log.info("공지사항 목록 페이지(검색 포함) - post");
		
		List<NoticeVO> list = null;
		PageBlock pageBlock = null;
	
		if (fSearchWord.equals("")) {
			list = noticeService.selectList(type, currentPage, 5);
			pageBlock = noticePagingService.paging(type, currentPage, 5);					
		} else {
			searchCondition = searchCondition.equals(fSearchCondition) ? searchCondition : fSearchCondition;
			searchWord = searchWord.equals(fSearchWord) ? searchWord : fSearchWord;
			
			list = noticeService.selectList(type, currentPage, 5, searchCondition, searchWord);
			pageBlock = noticePagingService.paging(type, currentPage, 5, searchCondition, searchWord);			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pageBlock", pageBlock);
	}	
	
	@RequestMapping("/newsView")
	public void noticeView(@RequestParam("type") String type
							, @RequestParam("seq") int seq
							, @RequestParam("totalRecords") int totalRecords
							, @RequestParam("notice_code") int notice_code
							, @RequestParam(value = "searchCondition", required = false) String searchCondition
							, @RequestParam(value = "searchWord", required = false) String searchWord
							, Model model
							) {
		
		log.info("게시글 상세보기");
		
		int currentPage = (totalRecords - seq) / 5 + 1;
		List<NoticeVO> list = null;
		
		if (searchCondition.equals("")) {			
			list = noticeService.selectView(type, notice_code);
		} else {
			list = noticeService.selectView(type, notice_code, searchCondition, searchWord);
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/newsWrite")
	public String noticeWrite(@SessionAttribute(required = false) EmpVO emp) {
		
		log.info("게시글 작성 페이지 - get");
		
		if (emp != null) return "notice/newsWrite";
		else			 return "404";	
	}
	
	@PostMapping("/newsWrite")
	public String noticeWrite(@ModelAttribute("vo") NoticeVO vo) {
		
		log.info("게시글 작성 - post");
		
		noticeService.write(vo);
		
		return "redirect:/notice/newsList?type=" + vo.getType();
	}
	
	@GetMapping("/newsDelete")
	public String noticeDelete(@RequestParam("type") String type
								, @RequestParam("notice_code") int notice_code
								, @SessionAttribute(required = false) EmpVO emp
								) {
		
		log.info("게시글 삭제");
		
		if(emp != null) {
			noticeService.delete(notice_code);
			return "redirect:/notice/newsList?type=" + type;
		} else {
			return "404";
		}
	}
	
	@GetMapping("/newsEdit")
	public String noticeEdit(@RequestParam("notice_code") int notice_code
							, @SessionAttribute(required = false) EmpVO emp
							, Model model
							) {
		
		log.info("게시글 수정(불러오기) 페이지 - get");
		
		if(emp != null) {
			NoticeVO vo = noticeService.selectOne(notice_code);
			model.addAttribute("vo", vo);
			return "notice/newsEdit";
		} else {
			return "404";
		}
	}
	
	@PostMapping("/newsEdit")
	public String noticeEdit(@ModelAttribute("vo") NoticeVO vo
							, @RequestParam("totalRecords") String totalRecords
							, @RequestParam("searchCondition") String searchCondition
							, @RequestParam("searchWord") String searchWord
							) {
		
		log.info("게시글 수정 - post");
		
		noticeService.update(vo);
		
		String location = "/notice/newsView?notice_code="+vo.getNotice_code() + "&type="+vo.getType() + "&seq="+vo.getSeq() + 
				"&searchCondition="+searchCondition + "&searchWord="+searchWord + "&totalRecords="+totalRecords;
		
		return "redirect:" + location;
	}
	
}
