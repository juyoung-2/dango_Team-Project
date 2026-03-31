package com.threeteam.dango.service.community;

import java.util.List;
import org.springframework.stereotype.Service;
import com.threeteam.dango.vo.community.BoardDTO;
import com.threeteam.dango.vo.community.BoardVO;

@Service
public interface BoardService {
	public Integer countAllByBoardNotice(BoardDTO boardDTO);
	public Integer countBoardSearchResult(BoardDTO boardDTO);
	public void insertBoard(BoardVO boardVO);
	public void updateBoard(BoardVO boardVO);
	public void viewsUpdate(BoardDTO boardVO);
	public void deleteBoard(BoardVO boardVO);
	public BoardDTO getBoard(Long boardId);
	public BoardVO getBoardInfo(BoardVO boardVO);
	public List<BoardDTO> getBoardList(BoardDTO boardVO);
	public List<BoardDTO> getBoardFivePost(BoardDTO boardDTO);
	public List<BoardVO> getBoardInfoList(BoardVO boardVO);
	public List<BoardDTO> communitySearch(BoardDTO boardDTO);
	public boolean adminCheck(BoardVO boardVO);
	public void adminY(BoardVO boardVO);
	public void adminN(BoardVO boardVO);
}
