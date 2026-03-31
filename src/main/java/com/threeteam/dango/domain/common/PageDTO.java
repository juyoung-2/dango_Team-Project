package com.threeteam.dango.domain.common;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageDTO {
	private int startPage;
    private int endPage;
    private boolean prev, next;
    private int prevNo;
    private int nextNo;
    private int total;
    private int page = 1;

    public PageDTO createPageDTO(int page, int total) {
        this.page = page;
        this.total = total;
        this.startPage = 1;
        this.endPage = (int)Math.ceil((double)total / 10); //20 -> 10으로 바꿈(10 대신 amount도 가능)
        this.prev = startPage != page;
        this.next = endPage != page;
        if(prev) {
            this.prevNo = page - 1;
        }
        if(next){
            this.nextNo = page + 1;
        }
        return this;
    }
}
