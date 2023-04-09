package com.domino.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class GlobalExceptionHandler {
	
	@ExceptionHandler(DataAccessException.class)
	@ResponseBody
	public ResponseEntity<String> sqlException(DataAccessException ex) {
		
		log.info(ex.getClass().getName());
		
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		String message = "<script>alert('에러가 발생했습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.'); history.back();</script>";
		
		return new ResponseEntity<String>(message, resHeaders, HttpStatus.NOT_FOUND);
	}
	
}
