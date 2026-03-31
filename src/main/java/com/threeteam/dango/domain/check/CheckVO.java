package com.threeteam.dango.domain.check;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CheckVO {
	private int checkId;
	private String userId;
	private Long wordId;
}
