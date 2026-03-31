package com.threeteam.dango.controller.recent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.recent.RecentService;

@Controller
@RequestMapping("/recent/*")
public class RecentController {
	
	@Autowired
	private RecentService recentService;
	
	private UserVO getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("user");
		return userInfo;
	}
	
//	@ResponseBody
//	@PostMapping(value = "/", consumes = "application/json")
//	public boolean insertRecent(@RequestBody Long wordId, HttpServletRequest request, Model model) {
//		HttpSession session = request.getSession();
//		UserVO userVO = (UserVO)session.getAttribute("user");
//		RecentVO vo = new RecentVO();
//		vo.setUserId(userVO.getUserId());
//		vo.setWordId(wordId);
//		boolean recent = recentService.isRecent(vo);
//		return recent;
//	}
	
	@GetMapping(value = "/getRecentList")
	public String getRecentList(HttpServletRequest request, Model model) {
		UserVO userVO = getSessionUser(request);
		if(userVO == null)
			return "redirect:/user/login";
		
		model.addAttribute("recentList", recentService.getRecentList(userVO));
		return "word/recentWord";
	}
}
