package com.threeteam.dango.controller.community;

import com.threeteam.dango.dao.community.BoardDAO;
import com.threeteam.dango.vo.community.BoardVO;

public class UpdateBoardController {

	public String updateBoard(BoardVO boardVO, BoardDAO boardDAO) {
		boardDAO.updateBoard(boardVO);
		return "getBoardList";
	}
	
}
