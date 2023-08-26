package kr.sanus.base1.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Board {

    private Long id;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime createdDate;

    public void update(String title, String content) {
        this.title = title;
        this.content = content;
    }

}