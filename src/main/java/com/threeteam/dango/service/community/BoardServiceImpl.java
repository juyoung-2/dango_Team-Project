package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.threeteam.dango.dao.community.BoardDAO;
import com.threeteam.dango.vo.community.BoardDTO;
import com.threeteam.dango.vo.community.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public Integer countAllByBoardNotice(BoardDTO boardDTO) {
		return boardDAO.countAllByBoardNotice(boardDTO);
	}
	
	@Override
	public Integer countBoardSearchResult(BoardDTO boardDTO) {
		return boardDAO.countBoardSearchResult(boardDTO);
	}
	
	@Override
	public void insertBoard(BoardVO boardVO) {
		boardDAO.insertBoard(boardVO);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		boardDAO.updateBoard(boardVO);
	}
	
	@Override
	public void viewsUpdate(BoardDTO boardVO) {
		boardDAO.viewsUpdate(boardVO);
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardDAO.deleteBoard(boardVO);
	}
	
	@Override
	public BoardDTO getBoard(Long boardId) {
		return boardDAO.getBoard(boardId);
	}
	
	@Override
	public BoardVO getBoardInfo(BoardVO boardVO) {
		return boardDAO.getBoardInfo(boardVO);
	}
	
	@Override
	public List<BoardDTO> getBoardList(BoardDTO boardVO){
		return boardDAO.getBoardList(boardVO);
	}
	
	@Override
	public List<BoardDTO> getBoardFivePost(BoardDTO boardDTO) {
		return boardDAO.getBoardFivePost(boardDTO);
	}
	
	@Override
	public List<BoardVO> getBoardInfoList(BoardVO boardVO){
		return boardDAO.getBoardInfoList(boardVO);
	}
	
	@Override
	public List<BoardDTO> communitySearch(BoardDTO boardDTO){
		return boardDAO.communitySearch(boardDTO);
	}
	
	@Override
	public boolean adminCheck(BoardVO boardVO) {
		boolean adminCheck = boardDAO.adminCheck(boardVO);
		if(!adminCheck) {
			boardDAO.adminY(boardVO);
		}else {
			boardDAO.adminN(boardVO);
		}
		return adminCheck;
	}
	
	@Override
	public void adminY(BoardVO boardVO) {
		boardDAO.adminY(boardVO);
	}
	
	@Override
	public void adminN(BoardVO boardVO) {
		boardDAO.adminN(boardVO);
	}
}
