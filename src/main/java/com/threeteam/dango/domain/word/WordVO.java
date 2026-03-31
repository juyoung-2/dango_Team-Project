package com.threeteam.dango.domain.word;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
public class WordVO {
	private Long wordId;
	private String wordWord;
	private String wordFurigana;
	private String wordMean;
	private Integer wordLevel;
	private Date wordRegisterDate;
	private Date wordUpdateDate;
}
