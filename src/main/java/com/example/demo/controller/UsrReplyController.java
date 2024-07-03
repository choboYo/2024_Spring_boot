package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReplyService;
import com.example.demo.util.Util;
import com.example.demo.vo.Rq;

@Controller
public class UsrReplyController {

	private ReplyService replyService;
	private Rq rq;

	public UsrReplyController(ReplyService replyService, Rq rq) {
		this.replyService = replyService;
		this.rq = rq;
	}

	@PostMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(String body, String relTypeCode, int relId) {

		replyService.writeReply(rq.getLoginedMemberId(), relTypeCode, relId, body);

		int id = replyService.getLastInsertId();

		return Util.jsReplace(String.format("%d번 댓글을 작성했습니다", id), String.format("../article/detail?id=%d", relId));
	}
	
	@GetMapping("/usr/reply/doDelete")
	@ResponseBody
	public String doDelete(int id, int relId) {
		
		replyService.deleteReply(id);
		
		return Util.jsReplace(String.format("%d번 댓글을 삭제했습니다", id), String.format("../article/detail?id=%d", relId));
	}
}