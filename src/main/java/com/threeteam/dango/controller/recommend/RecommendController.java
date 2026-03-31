package com.threeteam.dango.controller.recommend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.threeteam.dango.service.community.RecommendService;
import com.threeteam.dango.vo.community.RecommendVO;

@RestController
@RequestMapping("/recommend*")
public class RecommendController {

	@Autowired
	RecommendService recommendService;
	
	@PostMapping(value = "/add", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String plusRecommend(@RequestBody RecommendVO recommendVO) {
		recommendService.plusRecommend(recommendVO);
		return "success";
	}
	
	@PostMapping(value = "/remove", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String minusRecommend(@RequestBody RecommendVO recommendVO) {
		recommendService.minusRecommend(recommendVO);
		return "success";
	}
	
	@PostMapping(value = "", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String findByUserIdBoardId(@RequestBody RecommendVO recommendVO) {
		if(recommendService.findByUserIdBoardId(recommendVO) != 0)
			return "success";
		else
			return "fail";
	}
	
	@PostMapping(value = "/count", consumes = "application/json;", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String findCountByBoardId(@RequestBody RecommendVO recommendVO) {
		String result = "" + recommendService.findCountByBoardId(recommendVO.getBoardId());
		return result;
	}
}