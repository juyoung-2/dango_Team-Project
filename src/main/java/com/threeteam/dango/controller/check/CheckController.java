package com.threeteam.dango.controller.check;

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
import com.threeteam.dango.domain.check.CheckVO;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.check.CheckService;

@Controller
@RequestMapping("/check/*")
public class CheckController {

	@Autowired
	private CheckService checkService;
	
	private UserVO getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("user");
		return userInfo;
	}
	
	@ResponseBody
	@PostMapping(value="/toggleCheck", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String checkWord(@RequestBody CheckVO vo, HttpServletRequest request, Model model) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null)
			return "fail";
		
		vo.setUserId(userVO.getUserId());
		
		if(checkService.isCheck(vo) != null)
			return "success";
		
		return "fail";
	}
	
	@ResponseBody
	@PostMapping(value="/add", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String addCheck(@RequestBody CheckVO vo, HttpServletRequest request, Model model) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null) return "fail";
		
		vo.setUserId(userVO.getUserId());
		checkService.onCheck(vo);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping(value="/remove", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String removeCheck(@RequestBody CheckVO vo, HttpServletRequest request, Model model) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null) return "fail";
		
		vo.setUserId(userVO.getUserId());
		checkService.offCheck(vo);
		
		return "success";
	}

	@GetMapping(value="/getCheckList")
	public String getCheckList(HttpServletRequest request, Model model) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null)
			return "redirect:/user/login";

		model.addAttribute("user", userVO);
		model.addAttribute("checkList", checkService.getCheckList(userVO));
		return "word/checkWord";
	}
}
