package com.threeteam.dango.controller.word;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.threeteam.dango.domain.word.EndWordVO;
import com.threeteam.dango.service.word.EndWordService;

@RestController
@RequestMapping("/endWord/*")
public class EndWordRestController {
	
	@Autowired
	EndWordService endWordService;
	
	@PostMapping(value="/add", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String addEndWord(@RequestBody EndWordVO endWordVO) {
		String result = "fail";
		endWordService.addEndWord(endWordVO);
		
		if(endWordService.getEndWordByUserIdWordId(endWordVO) != null)
			result = "success";
		return result;
	}
}
