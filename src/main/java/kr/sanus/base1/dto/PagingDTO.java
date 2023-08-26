package kr.sanus.base1.dto;

import lombok.Data;

@Data
public class PagingDTO {

    private static final int PAGES_PER_GROUP = 10;

    private int page;
    private int size;
    private int totalElements;
    private int totalPages;
    private int lastPage;
    private int prevPage;
    private int nextPage;

    // 페이지 그룹 관련 변수
    private int startPageGroup;
    private int endPageGroup;

    public PagingDTO(int page, int size, int totalElements) {
        this.page = page;
        this.size = size;
        this.totalElements = totalElements;
        this.totalPages = (int) Math.ceil((double) totalElements / size);
        this.lastPage = totalPages;
        this.prevPage = page > 1 ? page - 1 : 1;
        this.nextPage = page < totalPages ? page + 1 : totalPages;

        // 페이지 그룹 계산
        int pageGroup = (page - 1) / PAGES_PER_GROUP;
        this.startPageGroup = pageGroup * PAGES_PER_GROUP + 1;
        this.endPageGroup = this.startPageGroup + PAGES_PER_GROUP - 1;
        if (this.endPageGroup > totalPages) {
            this.endPageGroup = totalPages;
        }
    }

    public boolean hasPreviousGroup() {
        return startPageGroup > 1;
    }

    public boolean hasNextGroup() {
        return endPageGroup < totalPages;
    }

    public int getPreviousGroupStartPage() {
        return startPageGroup - PAGES_PER_GROUP;
    }

    public int getNextGroupStartPage() {
        return endPageGroup + 1;
    }
}
