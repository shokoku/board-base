package kr.sanus.base1.entity;

import kr.sanus.base1.dto.Category;
import kr.sanus.base1.dto.Importance;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor
public class Board {

    private Long id;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime createdDate;
    private boolean secret;
    private Category category;
    private Importance importance;

    public Board(Long id, String title, String content, String writer, Boolean secret, Category category, Importance importance) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.createdDate = LocalDateTime.now();
        this.secret = secret;
        this.category = category;
        this.importance = importance;
    }

    public void update(String title, String content, Boolean secret, Category category, Importance importance) {
        this.title = title;
        this.content = content;
        this.secret = secret;
        this.category = category;
        this.importance = importance;
    }

}