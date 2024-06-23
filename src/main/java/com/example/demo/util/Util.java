package com.example.demo.util;

import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

public class Util {
	public static boolean isEmpty(String str) {
		return str == null || str.trim().length() == 0;
	}

	public static boolean isNull(String str) {
		return str == "null" || str.trim().length() == 0;
	}

}