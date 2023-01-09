package com.team.project.category.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {
	@GetMapping("category/list")
	public String categoryList() {
		return "category/list";
	}
}
