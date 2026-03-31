package com.threeteam.dango.domain.recent;

import java.sql.Date;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RecentVO {
	private String userId;
	private Long wordId;
	private Date recentUpdateDate;
}
