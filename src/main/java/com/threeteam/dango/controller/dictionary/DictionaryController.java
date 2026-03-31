package com.threeteam.dango.controller.dictionary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.threeteam.dango.domain.recent.RecentVO;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.recent.RecentService;
import com.threeteam.dango.service.word.WordService;

@Controller
@RequestMapping("/dictionary*")
public class DictionaryController {
	
	@Autowired
	private WordService wordService;
	
	@Autowired
	private RecentService recentService;
	
	private UserVO getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("user");
		return userInfo;
	}
	
	@GetMapping("")
	public String main() {
		return "/dictionary/dictionaryMain";
	}
	
	@GetMapping("/{wordId}")
	public String searchWord(@PathVariable("wordId") Long wordId, Model model, HttpServletRequest request) {
		UserVO userInfo = getSessionUser(request);
		if(userInfo != null) {
			RecentVO recentVO = new RecentVO();
			recentVO.setUserId(userInfo.getUserId());
			recentVO.setWordId(wordId);
			if(recentService.isRecent(recentVO) == null) 
				recentService.setRecent(recentVO);
			else
				recentService.updateRecent(recentVO);
		}
		model.addAttribute("sentence", wordService.getSentenceByWordId(wordId));
		return "/dictionary/dictionarySearch";
	}
	
	@GetMapping("/search")
	public String searchResult(String keyword, Model model) {
		model.addAttribute("wordList", wordService.getWordAllByKeyword(keyword));
		return "/dictionary/dictionaryList";
	}
}
