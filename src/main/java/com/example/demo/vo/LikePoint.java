package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikePoint {
	int id;
	int memberId;
	String relTypeCode;
	int relId;
	int point;
}
