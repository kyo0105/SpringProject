package com.domino.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.domino.domain.EmpVO;
import com.domino.domain.MemberVO;
import com.domino.domain.SnsVO;
import com.domino.service.EmpService;
import com.domino.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@SessionAttributes({"member", "emp"})
@RequestMapping("/global")
public class LoginController {
	
	private final MemberService memberService;
	private final EmpService empService;
	
	@GetMapping("/login")
	public void login() { log.info("로그인페이지"); }
	
	@PostMapping("/login")
	@ResponseBody
	public String login(@RequestParam("id") String id
						, @RequestParam("passwd") String passwd
						, @RequestParam("cid") String cid
						, Model model 
						, HttpServletResponse response
						) { 
		
		log.info("로그인");
		
		Map<String, Object> member = memberService.login(id, passwd);
		SnsVO snsChk = (SnsVO) member.get("snsChk");
		
		if (snsChk != null) return snsChk.getSns(); 
		
		MemberVO memberVO = (MemberVO) member.get("vo");
		EmpVO empVO = empService.login(id, passwd);
		
		model.addAttribute("member", memberVO);
		model.addAttribute("emp", empVO);
		
		if (cid.equals("y")) {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 60 * 24 * 7);		// 7일 동안 쿠키 유지
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("id", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		if (memberVO != null || empVO != null)   return "success";									  
		else									 return "fail";
		
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) { 
		
		log.info("로그아웃");
		
		sessionStatus.setComplete();	// 세션 제거
		
		return "redirect:/";
	}
	
}
