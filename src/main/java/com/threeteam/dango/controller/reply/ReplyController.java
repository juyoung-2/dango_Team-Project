package com.threeteam.dango.controller.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.threeteam.dango.service.community.ReplyService;
import com.threeteam.dango.vo.community.ReplyVO;

@RestController
@SessionAttributes("reply")
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService replyService;
	
	@GetMapping("/")
	public String replyMain(ReplyVO replyVO, Model model) {
		return "/reply/main";
	}
	
	@GetMapping("/insertReply")
	public String insertReply(@RequestBody ReplyVO replyVO) {
		replyService.insertReply(replyVO);
		return "/reply/insertReply";
	}
	
	@GetMapping("/deleteReply/{replyId}")
	public String deleteReply(@RequestBody ReplyVO replyVO) {
		replyService.deleteReply(replyVO);
		return "/reply/deleteReply";
	}
	
	@GetMapping("/updateReply/{replyId}")
	public String updateReply(@PathVariable Long replyId, @RequestBody ReplyVO replyVO) {
		replyService.updateReply(replyVO);
		return "/reply/updateReply";
	}
	
	@GetMapping("/getReply")
	public String getReply(ReplyVO replyVO, Model model) {
		model.addAttribute("reply", replyService.getReply(replyVO));
		return ".jsp";
	}
	
	@GetMapping("/getReplyList")
	public String getReplyList(ReplyVO replyVO, Model model) {
		model.addAttribute("reply", replyService.getReplyList(replyVO));
		return ".jsp";
	}
}
