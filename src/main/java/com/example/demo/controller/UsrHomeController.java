package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.FileService;
import com.example.demo.util.Util;
import com.example.demo.vo.FileVO;

@Controller
public class UsrHomeController {

	@Value("${custom.apiTest1.key}")
	private String apiTest1Key;
	
	private FileService fileService;
	
	public UsrHomeController(FileService fileService) {
		this.fileService = fileService;
	}
	
	@GetMapping("/usr/home/main")
	public String showMain() {
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@GetMapping("/usr/home/popUp")
	public String popUp() {
		return "usr/home/popUp";
	}
	
	@GetMapping("/usr/home/apiTest1")
	public String apiTest1(Model model) {
		
		model.addAttribute("apiTest1Key", apiTest1Key);
		
		return "usr/home/apiTest1";
	}
	
	@GetMapping("/usr/home/apiTest2")
	public String apiTest2() {
		return "usr/home/apiTest2";
	}
	
	@PostMapping("/usr/home/upload")
	@ResponseBody
	public String upload(MultipartFile file) {
		
		if (file.isEmpty()) {
			return Util.jsHistoryBack("파일이 선택되지 않았습니다");
		}
		
		try {
			fileService.saveFile(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return Util.jsReplace("파일 업로드 성공", "/");
	}
	
	@GetMapping("/usr/home/view")
	public String view(Model model) {
		
		List<FileVO> files = fileService.getFiles();
		
		model.addAttribute("files", files);
		
		return "usr/home/view";
	}
	
	@GetMapping("/usr/home/file/{fileId}")
	@ResponseBody
	public Resource fileLoad(@PathVariable("fileId") int id, Model model) throws IOException {
		
		FileVO fileVo = fileService.getFileById(id);
		
		return new UrlResource("file:" + fileVo.getSavedPath());
	}
	
	@GetMapping("/usr/home/checkboxBasic")
	public String checkboxBasic(Model model) {
		return "usr/home/checkboxBasic";
	}
	
	@PostMapping("/usr/home/checkboxSubmit")
	public String checkboxSubmit(Model model, @RequestParam(name = "ids", required = false) List<String> ids) {
		
		model.addAttribute("ids", ids);
		
		return "usr/home/checkboxSubmit";
	}
}