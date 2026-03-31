package com.threeteam.dango.controller.community;

import com.threeteam.dango.dao.community.BoardDAO;
import com.threeteam.dango.vo.community.BoardVO;

public class DeleteBoardController {

	public String deleteBoard(BoardVO boardVO, BoardDAO boardDAO) {
		boardDAO.deleteBoard(boardVO);
		return "getBoardList";
	}
}
