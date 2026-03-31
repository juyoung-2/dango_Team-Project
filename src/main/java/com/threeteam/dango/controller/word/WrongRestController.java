package com.threeteam.dango.controller.word;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.threeteam.dango.domain.word.WrongVO;
import com.threeteam.dango.service.word.WrongService;

@RestController
@RequestMapping("/wrong/*")
public class WrongRestController {
	
	@Autowired
	WrongService wrongService;
	
	@PostMapping(value="/add", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String addWrong(@RequestBody WrongVO wrongVO) {
		String check = "fail";
		
		wrongService.addWrong(wrongVO);
		if(wrongService.getWrongVOByUserIdWordId(wrongVO) != null)
			check = "success";
		
		return check;
	}
	
	@PostMapping(value="/update", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String updateWrong(@RequestBody WrongVO wrongVO) {
		wrongService.setWrong(wrongVO);
		return "success";
	}
	
	@DeleteMapping(value="/remove", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String removeWrong(@RequestBody Long wrongId) {
		wrongService.removeWrong(wrongId);
		return "success";
	}
}
