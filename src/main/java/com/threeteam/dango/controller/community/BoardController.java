package com.threeteam.dango.controller.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.threeteam.dango.domain.common.PageDTO;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.community.BoardService;
import com.threeteam.dango.service.community.CommentService;
import com.threeteam.dango.vo.community.BoardDTO;
import com.threeteam.dango.vo.community.BoardVO;

@Controller
@RequestMapping("/community*")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	CommentService commentService;
	
	private UserVO getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("user");
		return userInfo;
	}
	
	@GetMapping("")
	public String boardMain(BoardDTO boardVO, Model model) {
		boardVO.setBoardNotice(1);
		model.addAttribute("boardInfoList", boardService.getBoardFivePost(boardVO));
		boardVO.setBoardNotice(0);
		model.addAttribute("boardList", boardService.getBoardFivePost(boardVO));
		return "community/Community";
	}
	
	@GetMapping("/boardInsert")
	public String getInsertPage(BoardVO boardVO, HttpServletRequest request) {
		UserVO user = getSessionUser(request);
		if(user == null)
			return "redirect:/user/login";
		return "community/CommunityNewPost";
	}
	
	@PostMapping("/boardInsert")
	public String insertBoard(BoardVO boardVO) {
		boardService.insertBoard(boardVO);
		return "redirect:/community/free";
	}
	
	@PostMapping("/boardUpdatePage")
	public String getUpdatePage(BoardVO boardVO, Model model) {
		model.addAttribute("board", boardService.getBoard(boardVO.getBoardId()));
		return "community/CommunityEditPost";
	}
	
	@PostMapping("/boardUpdate")
	public String updateBoard(BoardVO boardVO) {
		boardService.updateBoard(boardVO);
		return "redirect:/boardView/" + boardVO.getBoardId();
	}
	
	@PostMapping("/boardDelete")
	public String deleteBoard(BoardVO boardVO) {
		commentService.deleteCommentAllByBoardId(boardVO.getBoardId());
		boardService.deleteBoard(boardVO);
		return "redirect:/community/free";
	}
	
	@GetMapping("/boardView/{boardId}")
	public String BoardView(@PathVariable("boardId") Long boardId, BoardDTO boardDTO, Model model) {
		boardDTO = boardService.getBoard(boardId);
		boardDTO.setBoardViews(boardDTO.getBoardViews() + 1);
		boardService.viewsUpdate(boardDTO);
		model.addAttribute("board", boardDTO);
		return "community/CommunityPostPage";
	}
	
	@GetMapping("/{boardCategory}")
	public String getBoardList(@PathVariable("boardCategory") String boardCategory, BoardDTO boardVO, Model model) {
		if(boardCategory.equals("free")) 			
			boardVO.setBoardNotice(0);
		else if(boardCategory.equals("notice"))		
			boardVO.setBoardNotice(1);
		else
			return "redirect:/community";
		Integer pageTotal = 0;
		if(boardVO.getKeyword() != null) {
			model.addAttribute("category", boardCategory);
	        model.addAttribute("boardList", boardService.communitySearch(boardVO));
	        model.addAttribute("keyword", boardVO.getKeyword());
	        pageTotal = boardService.countBoardSearchResult(boardVO);
	        model.addAttribute("pagination", new PageDTO().createPageDTO(boardVO.getPage(), pageTotal));
			
	        return "community/CommunitySearchResult";
		} else {
			model.addAttribute("category", boardCategory);
			model.addAttribute("boardList", boardService.getBoardList(boardVO));
			pageTotal = boardService.countAllByBoardNotice(boardVO);
			model.addAttribute("pagination", new PageDTO().createPageDTO(boardVO.getPage(), pageTotal));
			
			return "community/CommunityList";
		}
		
	}
	
	
//	@GetMapping("/CommunitySearch")
//	public String communitySearch(@RequestParam("keyword") String keyword, Model model) {
//		List<BoardDTO> boardList = boardService.communitySearch(keyword);
//        model.addAttribute("boardList", boardList);
//        model.addAttribute("keyword", keyword);
//        return "community/CommunityList";
//	}
	
	@GetMapping("/admincheck")
	public boolean adminCheck(BoardVO boardVO) {
		boolean adminCheck = boardService.adminCheck(boardVO);
		return adminCheck;
	}
	
}