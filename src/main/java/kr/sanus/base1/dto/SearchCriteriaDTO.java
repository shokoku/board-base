package kr.sanus.base1.dto;

import lombok.Data;

@Data
public class SearchCriteriaDTO {
    private PagingDTO pagingInfo;
    private String keyword;
    private String type;

    public SearchCriteriaDTO() {
    }

    public SearchCriteriaDTO(PagingDTO pagingInfo, String type, String keyword) {
        this.pagingInfo = pagingInfo;
        this.type = type;
        this.keyword = keyword;
    }
}