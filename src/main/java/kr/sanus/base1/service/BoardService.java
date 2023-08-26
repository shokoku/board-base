package kr.sanus.base1.service;

import kr.sanus.base1.dto.BoardDTO;
import kr.sanus.base1.entity.Board;
import kr.sanus.base1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardMapper boardMapper;

    @Transactional
    public void add(BoardDTO boardDTO, HttpSession session) {
        String userId = Optional.ofNullable((String) session.getAttribute("id"))
                .orElse("guest");

        Board board = new Board(null, boardDTO.getTitle(), boardDTO.getContent(), userId, LocalDateTime.now());

        boardMapper.save(board);
    }

    public List<BoardDTO> findAll() {
        return boardMapper.findAll().stream().map(this::convertToDTO).collect(Collectors.toList());
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
                .orElseThrow(() -> new NoSuchElementException("No Board found with ID " + id));
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