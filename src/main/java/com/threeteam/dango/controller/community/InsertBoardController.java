package com.threeteam.dango.controller.community;

import org.springframework.stereotype.Controller;
import com.threeteam.dango.dao.community.BoardDAO;
import com.threeteam.dango.vo.community.BoardVO;

@Controller
public class InsertBoardController {

	public String insertBoard(BoardVO boardVO, BoardDAO boardDAO) {
		boardDAO.insertBoard(boardVO);
		return "getBoardList";
	}
		
}
