package kr.sanus.base1.controller;

import kr.sanus.base1.dto.BoardDTO;
import kr.sanus.base1.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Random;

@Component
public class TestDataGenerator {

    private static final Random RANDOM = new Random();
    private final BoardService boardService;

    @Autowired
    public TestDataGenerator(BoardService boardService) {
        this.boardService = boardService;
    }

    public BoardDTO createRandomBoardDTO() {
        return BoardDTO.builder()
                .title("Test Title " + RANDOM.nextInt(1000))
                .content("Test Content " + RANDOM.nextInt(1000))
                .writer("User" + RANDOM.nextInt(100))
                .createdDate(LocalDateTime.now())
                .build();
    }

    public void generateAndSaveBoardDTOs(int count) {
        for (int i = 0; i < count; i++) {
            BoardDTO boardDTO = createRandomBoardDTO();
            boardService.add(boardDTO, null); // Assuming 'add' method can handle null session
        }
    }
}
