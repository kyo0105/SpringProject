package com.domino.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() { 
		log.info("메인페이지");
		
		return "main"; 
	}
	
}
