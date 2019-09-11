package kr.zalbazo.model.content;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter
public class Content {

	private Long contentId;
	private String title;
	private String body;
	private String userEmail;
	private Date createdDate;
	private Date updatedDate;
	private Long categoryId;

}
