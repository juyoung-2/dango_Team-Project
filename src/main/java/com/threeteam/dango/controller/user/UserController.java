package com.threeteam.dango.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService userservice;
	
	private UserVO getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("user");
		
		return userInfo;
	}
	
	@GetMapping("/")
	public String homePage() {
		return "/mainpage";
	}
	
	@GetMapping("/login")
	public String gologinPage(HttpServletRequest request) {
		UserVO userVO = getSessionUser(request);
		if(userVO != null)
			return "redirect:/";
		
		return "/user/login" ;
	}
	
	@PostMapping("/login")
	public String userLogin(String id,String pw,Model model,HttpServletRequest request) {
		UserVO user = userservice.login(id, pw);
		if(user == null) {
			model.addAttribute("message","계정이 존재하지 않습니다");
		}
		//model.addAttribute("userinfo",user);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String userlogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/" ;
	}
	
	@GetMapping("/register")
	public String register(HttpServletRequest request) {
		UserVO userVO = getSessionUser(request);
		if(userVO != null)
			return "redirect:/";
		
		return "/user/signup" ;
	}
	
	@PostMapping("/register")
	public String newregister(UserVO user,RedirectAttributes rttr) {
		userservice.register(user);
		rttr.addFlashAttribute("message","계정 생성 완료");
		return "redirect:/user/login";
	}
	
	@GetMapping("/modify")
	public String updatepage(HttpServletRequest request, Model model) {
		UserVO user = getSessionUser(request);
		if(user == null)
			return "redirect:/user/login";
		model.addAttribute("userinfo", user);
		return "/user/myPage";
	}
	
	@PostMapping("/myPage")
	public String infomodify(UserVO user,HttpServletRequest request,Model model, RedirectAttributes redirectAttributes) {
		String message = "정보 수정을 실패하였습니다.";
		
		if(userservice.update(user)) {
			message = "정보 수정 완료!";
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/user/modify";
	}
	
	@PostMapping("/regout")
	public String userregout(HttpServletRequest request,RedirectAttributes rttr) {
		UserVO id = getSessionUser(request);
		
		if(userservice.remove(id.getUserId())) {
			rttr.addFlashAttribute("message","회원 탈퇴 완료");
		}
		return "redirect:/user/login" ;
	}
	
	@GetMapping("/userfindId")
	public String findIdPage(HttpServletRequest request) {
		UserVO userVO = getSessionUser(request);
		if(userVO != null)
			return "redirect:/";
		
		return "/user/findID" ;
	}
	
	@GetMapping("/userfindPw")
	public String findPwPage(HttpServletRequest request) {
		UserVO userVO = getSessionUser(request);
		if(userVO != null)
			return "redirect:/";
		
		return "/user/findPW";
	}
	
	@PostMapping("/findID")
	public String findid(String email,String phone,RedirectAttributes rttr, Model model) {
		UserVO userinfo = new UserVO();
		userinfo.setUserEmail(email);
		userinfo.setUserPhone(phone);
		if(userservice.findid(userinfo) != null) {
			rttr.addFlashAttribute("id",userservice.findid(userinfo));
		}
		else {
			rttr.addFlashAttribute("namecheck","아이디 찾기 실패");
		}
		model.addAttribute("userId", userservice.findid(userinfo));
		
		return "/user/findIdResult";
	}
	
	@GetMapping("/findPW")
	public String findpw(UserVO userVO, RedirectAttributes rttr, Model model) {
		Integer isUser = userservice.findpw(userVO);
		int checkNum = -1;
		if(isUser != 0) {
			checkNum = (int)(Math.random() * 10000);
			String email = userVO.getUserEmail();
		}
		model.addAttribute("checkNum", checkNum);
		return "/user/findPW";
	}
	
}
