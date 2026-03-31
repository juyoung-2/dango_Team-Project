package com.threeteam.dango.vo.community;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class ScrapVO {
	private Long scrapId;
	private Long boardId;
	private String userId;
	private Date scrapRegisterdate;
	private Date scrapUpdatedate;
}