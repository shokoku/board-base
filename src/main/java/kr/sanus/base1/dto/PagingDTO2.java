package kr.sanus.base1.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingDTO2 {

    private static final int DEFAULT_SIZE = 10; // 기본적으로 한 페이지에 보여줄 아이템 수
    private int page;                           // 현재 페이지 번호
    private int size = DEFAULT_SIZE;            // 한 페이지에 보여줄 아이템 수
    private int totalElements;                  // 전체 아이템 수
    private int totalPages;                     // 전체 페이지 수
    private int firstPage = 1;                  // 첫 페이지 번호
    private int lastPage;                       // 마지막 페이지 번호
    private int prevPage;                       // 이전 페이지 번호
    private int nextPage;                       // 다음 페이지 번호

    public PagingDTO2() {
    }

    public PagingDTO2(int page, int totalElements) {
        this.page = page;
        this.totalElements = totalElements;
        this.totalPages = (int) Math.ceil((double) totalElements / size);
        this.lastPage = totalPages;
        this.prevPage = page > 1 ? page - 1 : 1;
        this.nextPage = page < totalPages ? page + 1 : totalPages;
    }


}
