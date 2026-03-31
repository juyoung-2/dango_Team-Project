//package com.threeteam.dango.controller.community;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.web.servlet.ModelAndView;
//import com.threeteam.dango.dao.community.BoardDAO;
//import com.threeteam.dango.service.community.BoardService;
//import com.threeteam.dango.vo.community.BoardVO;
//
//public class getBoardController {
//
//	@Autowired
//	BoardService boardService;
//	
//	public ModelAndView getBoard(BoardVO boardVO, BoardDAO boardDAO, ModelAndView mav) {
//		BoardVO infoCheck = boardService.getBoard(boardVO);
//		
//		if(infoCheck != null) {
//			if("Y".equals(infoCheck.getBoardNotice())){
//				mav.addObject("boardInfo", boardDAO.getBoardInfo(boardVO));
//				mav.setViewName(".jsp");
//			}
//			else if("N".equals(infoCheck.getBoardNotice())){
//				mav.addObject("board", boardDAO.getBoard(boardVO));
//				mav.setViewName(".jsp");
//			}
//			else {
//				return null;
//			}
//		}else {
//				return null;
//		}
//		
//		return mav;
//	}
//}
