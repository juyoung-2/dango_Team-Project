package com.threeteam.dango.controller.word;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.check.CheckService;
import com.threeteam.dango.service.recent.RecentService;

@Controller
@RequestMapping("/dango/*")
public class WordMainController {
	
	@Autowired
	private CheckService checkService;
	
	@Autowired
	private RecentService recentService;
	
	public String wordMain(HttpServletRequest request, Model model) {
		System.out.println("단어장 main 화면");
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		model.addAttribute("checkList", checkService.getCheckList(userVO));
		model.addAttribute("recentList", recentService.getRecentList(userVO));
		return "/word/main";
	}
}
