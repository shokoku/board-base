package kr.sanus.base1.service;

import kr.sanus.base1.dto.BoardDTO;
import kr.sanus.base1.dto.SearchCriteriaDTO;
import kr.sanus.base1.entity.Board;
import kr.sanus.base1.exception.BoardNotFoundException;
import kr.sanus.base1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardMapper boardMapper;

    @Transactional
    public long add(BoardDTO boardDTO, HttpSession session) {
        String userId = Optional.ofNullable(session)
                .map(s -> (String) s.getAttribute("id"))
                .orElse("guest");

        Board board = new Board(null, boardDTO.getTitle(), boardDTO.getContent(), userId);
        boardMapper.save(board);
        return board.getId();
    }

    public List<BoardDTO> findAll(SearchCriteriaDTO searchCriteriaDTO) {
        int offset = (searchCriteriaDTO.getPagingInfo().getPage() - 1) * searchCriteriaDTO.getPagingInfo().getSize();
        List<Board> boards = boardMapper.findAll(offset, searchCriteriaDTO.getPagingInfo().getSize(), searchCriteriaDTO.getType(), searchCriteriaDTO.getKeyword());
        return boards.stream().map(this::convertToDTO).collect(Collectors.toList());
    }

    public int getTotalCount(String type, String keyword) {
        return boardMapper.getTotalCount(type, keyword);
    }


    public BoardDTO findById(long id) {
        return convertToDTO(findBoardById(id));
    }

    @Transactional
    public void edit(Long id, BoardDTO boardDTO) {
        Board board = findBoardById(id);
        board.update(boardDTO.getTitle(), boardDTO.getContent());
        boardMapper.update(board);
    }

    @Transactional
    public void delete(Long id) {
        boardMapper.delete(id);
    }

    private Board findBoardById(long id) {
        return boardMapper.findById(id)
                .orElseThrow(() -> new BoardNotFoundException("No Board found with ID " + id));
    }

    private BoardDTO convertToDTO(Board board) {
        return BoardDTO.builder()
                .id(board.getId())
                .title(board.getTitle())
                .content(board.getContent())
                .writer(board.getWriter())
                .createdDate(board.getCreatedDate())
                .build();
    }
}
