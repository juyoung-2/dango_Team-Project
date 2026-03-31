package com.threeteam.dango.mapper.community;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.threeteam.dango.vo.community.BoardDTO;
import com.threeteam.dango.vo.community.BoardVO;

@Mapper
public interface BoardMapper {
	public Integer countBoardAll(BoardDTO boardDTO);
	public Integer countBoardSearchResult(BoardDTO boardDTO);
	public BoardDTO getBoard(Long board);
	public BoardVO getBoardInfo(BoardVO boardVO);
	public List<BoardDTO> getBoardList(BoardDTO boardDTO);
	public List<BoardDTO> getBoardFivePost(BoardDTO boardDTO);
	public List<BoardVO> getBoardInfoList(BoardVO boardVO);
	public void insertBoard(BoardVO boardVO);
	public void deleteBoard(BoardVO boardVO);
	public void updateBoard(BoardVO boardVO);
	public void viewsUpdate(BoardDTO boardVO);
	public List<BoardDTO> communitySearch(BoardDTO boardDTO);
	public boolean adminCheck(BoardVO boardVO);
	public void adminY(BoardVO boardVO);
	public void adminN(BoardVO boardVO);
}