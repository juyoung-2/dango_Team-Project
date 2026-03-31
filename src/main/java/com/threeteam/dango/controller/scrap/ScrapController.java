package com.threeteam.dango.controller.scrap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.community.ScrapService;
import com.threeteam.dango.vo.community.ScrapVO;

@Controller
@RequestMapping("/scrap*")
public class ScrapController {

	@Autowired
	ScrapService scrapService;
	
	private UserVO getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("user");
		return userInfo;
	}
	
	@GetMapping("")
	public String scrapMain(ScrapVO scrapVO, Model model, HttpServletRequest request) {
		UserVO user = getSessionUser(request);
		if(user == null)
			return "redirect:/user/login";
		
		scrapVO.setUserId(user.getUserId());
		model.addAttribute("boardList", scrapService.getScrapList(scrapVO));
		model.addAttribute("category", "scrap");
		return "/community/CommunityList";
	}
	
	@ResponseBody
	@PostMapping(value="/insertScrap", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String insertScrap(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null) return "fail";
		scrapVO.setUserId(userVO.getUserId());
		scrapService.insertScrap(scrapVO);
		return "success";
	}
	
	@ResponseBody
	@PostMapping(value="/deleteScrap", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String deleteScrap(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null) return "fail";
		scrapVO.setUserId(userVO.getUserId());
		scrapService.deleteScrap(scrapVO);
		return "success";
	}
	
	@ResponseBody
	@PostMapping(value="/getScrap", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String getScrap(@RequestBody ScrapVO scrapVO, HttpServletRequest request) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null)
			return "fail";
		
		scrapVO.setUserId(userVO.getUserId());
		if(scrapService.getScrap(scrapVO) != null)
			return "success";
		
		return "fail";
	}
	
}
