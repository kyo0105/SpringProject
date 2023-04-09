package com.domino.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.domino.domain.AgreeVO;
import com.domino.domain.MemberVO;
import com.domino.domain.SnsVO;
import com.domino.oauth.KakaoLoginBO;
import com.domino.oauth.NaverLoginBO;
import com.domino.service.MemberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@SessionAttributes({"member", "snsUser", "snsInfo"})
@RequestMapping(value = { "/global", "/member" })
public class SnsLoginController {
	
	private final NaverLoginBO naverLoginBO;
	private final KakaoLoginBO kakaoLoginBO;
	private final MemberService memberService;
	private String apiResult = null;
	
	@GetMapping("/snsLogin")
	public String naverLoginPage(HttpSession session, @RequestParam String sns) {
		
		log.info("sns 로그인 페이지 요청");
		
		if (sns.equals("naver")) {
			
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			
			return "redirect:" + naverAuthUrl;
		} else if (sns.equals("kakao")) {

			String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl();
			
			return "redirect:" + kakaoAuthUrl;
		} else {
			return "redirect:/global/login";
		}
	}
	
	@RequestMapping(value = "/callbackNaver", method = {RequestMethod.GET, RequestMethod.POST})
	public String naverLogin(@RequestParam String code
							, @RequestParam String state
							, Model model
							, HttpSession session
							, RedirectAttributes redirect
							) throws Exception {
		
		log.info("네이버 로그인 콜백");
		
		System.out.println("code : " + code);
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		// 네이버 로그인 사용자 정보 가져오기
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		@SuppressWarnings("unchecked")
		Map<String, Object> apiJSON = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		
		// 아이디, 이름, 이메일, 전화번호, 생년월일
		String sns_id = (String) apiJSON.get("id");
		String member_id = "naver_" + sns_id.substring(0, 10);
		String name = (String) apiJSON.get("name");
		String email = (String) apiJSON.get("email");
		String tel = (String) apiJSON.get("mobile");
		String strBir = (String) apiJSON.get("birthyear") + "-" + (String) apiJSON.get("birthday");
		Date birth = Date.valueOf(strBir);
		
		MemberVO mvo = new MemberVO();
		mvo.setMember_id(member_id);
		mvo.setName(name);
		mvo.setBirth(birth);
		mvo.setTel(tel);
		mvo.setEmail(email);
		
		Map<String, Object> snsChk = memberService.snsCheck(tel);
		MemberVO resultVO = (MemberVO) snsChk.get("member");
		
		if (snsChk.get("status").equals("회원가입")) {
			
			model.addAttribute("snsUser", mvo);
			redirect.addFlashAttribute("snsInfo", sns_id);
			return "redirect:/member/regStepSns";
		} else if (snsChk.get("status").equals("연동")) {

			Map<String, Object> snsInfo = new HashMap<String, Object>();
			snsInfo.put("sns_id", sns_id);
			snsInfo.put("sns_name", "네이버");
			snsInfo.put("sns", "naver");
			snsInfo.put("member_id", resultVO.getMember_id());
			snsInfo.put("join_date", resultVO.getJoin_date());
			
			model.addAttribute("snsInfo", snsInfo);
			return "redirect:/member/accountLinkage";
		} else if (snsChk.get("status").equals("naver") && snsChk.get("sns_id").equals(sns_id)){
			
			model.addAttribute("member", snsChk.get("member"));
			return "redirect:/";
		} else {
			// 다른 sns와 연동된 상태
			return "redirect:/global/loginAlert?msg=link";
		}
		
	}

	@RequestMapping(value = "/callbackKakao", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam String code , Model model) throws Exception {
		
		log.info("카카오 로그인 콜백");
		
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(code);
	
		// 카카오 로그인 사용자 정보 가져오기
		apiResult = kakaoLoginBO.getUserProfile(oauthToken); 

		ObjectMapper objectMapper = new ObjectMapper();
			
		@SuppressWarnings("unchecked")
		Map<String, Object> apiJSON = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("kakao_account");
	
		String sns_id = String.valueOf(objectMapper.readValue(apiResult, Map.class).get("id"));
		String email = (String) apiJSON.get("email");
		
		// 카카오 제약에 의한 전화번호 대신 이메일로 임시 체크
		Map<String, Object> snsChk = memberService.snsEmailCheck(email);
		MemberVO resultVO = (MemberVO) snsChk.get("member");
		
		if (snsChk.get("status").equals("회원가입")) {
			
			return "redirect:/global/loginAlert?msg=reg";
		} else if (snsChk.get("status").equals("연동")) {

			Map<String, Object> snsInfo = new HashMap<String, Object>();
			snsInfo.put("sns_id", sns_id);
			snsInfo.put("sns_name", "카카오");
			snsInfo.put("sns", "kakao");
			snsInfo.put("member_id", resultVO.getMember_id());
			snsInfo.put("join_date", resultVO.getJoin_date());
			
			model.addAttribute("snsInfo", snsInfo);
			return "redirect:/member/accountLinkage";
		} else if (snsChk.get("status").equals("kakao") && snsChk.get("sns_id").equals(sns_id)){
			
			model.addAttribute("member", snsChk.get("member"));
			return "redirect:/";
		} else {
			// 다른 sns와 연동된 상태
			return "redirect:/global/loginAlert?msg=link";
		}
	
	}
	
	@GetMapping("/regStepAlert")
	public String regStepAlert(Model model) { 
		
		log.info("sns 연동 전 회원가입 요청");
		
		model.addAttribute("msg", "연동 가능한 계정이 없습니다. 회원가입을 먼저 진행해주세요.");
		
		return "member/regStep1";
	}
	
	@GetMapping("/regStepSns")
	public void regStepSns() { log.info("sns 간편 회원가입 페이지"); }
	
	@PostMapping("/regStepSns")
	public String regStepSns(@SessionAttribute MemberVO snsUser
							, @SessionAttribute String snsInfo
							, SessionStatus sessionStatus
							, @RequestParam int birth_type
							, @RequestParam String gender
							, @RequestParam int info_date
							, @RequestParam("ds_fl") int message
							, @RequestParam("dm_fl") int email
							, @RequestParam("o_dm_fl") int mail
							) {
		
		log.info("sns 간편 회원가입");
		
		String[] snsName = snsUser.getMember_id().split("_");
		
		snsUser.setBirth_type(birth_type);
		snsUser.setGender(gender);
		snsUser.setInfo_date(info_date);
		
		AgreeVO avo = new AgreeVO();
		avo.setMember_id(snsUser.getMember_id());
		avo.setMessage(message);
		avo.setEmail(email);
		avo.setMail(mail);
		
		SnsVO svo = new SnsVO();
		svo.setMember_id(snsUser.getMember_id());
		svo.setSns(snsName[0]);
		svo.setSns_id(snsInfo);
		
		memberService.snsMemberInsert(svo, snsUser, avo);
		
		sessionStatus.setComplete();	// 세션 제거
		
		return "member/regStep2Proc";
	}
	
	@GetMapping("/accountLinkage")
	public void accountLinkage() {
		
		log.info("기존 계정과 sns 연동 페이지");
	}
	
	@PostMapping("/accountLinkage")
	@ResponseBody
	public String accountLinkage(@SessionAttribute Map<String, Object> snsInfo
								, SessionStatus sessionStatus
								, @RequestParam String passwd
								, Model model
								) {
		
		log.info("기존 계정과 sns 연동");
		
		String member_id = (String) snsInfo.get("member_id");
		String sns = (String) snsInfo.get("sns");
		String sns_id = (String) snsInfo.get("sns_id");
		
		Map<String, Object> member = memberService.login(member_id, passwd);
		MemberVO memberVO = (MemberVO) member.get("vo");
		
		if (member.get("vo") == null) {
			return "fail";
		} else {
			
			SnsVO svo = new SnsVO();
			svo.setMember_id(member_id);
			svo.setSns(sns);
			svo.setSns_id(sns_id);
			
			memberService.snsConnection(svo);
			
			model.addAttribute("snsInfo", null);
			model.addAttribute("member", memberVO);
			
			sessionStatus.setComplete();	// 세션 제거
			
			return "success";
		}
	}
	
	@GetMapping("/loginAlert")
	public String loginAlert(Model model, @RequestParam String msg) {
	
		log.info("sns 간편 로그인시 필요 알림");
		
		if (msg.equals("reg")) {
			model.addAttribute("msg", "가입된 회원 정보가 없습니다. 회원가입을 해주세요.");
		} else if (msg.equals("link")) {
			model.addAttribute("msg", "다른 sns 계정으로 연동되어 있습니다.");
		} else {
			return "redirect:/global/login";
		}
		
		return "global/login";
	}
	
}
