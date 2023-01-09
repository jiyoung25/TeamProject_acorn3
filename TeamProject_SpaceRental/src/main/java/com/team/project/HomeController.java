package com.team.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.category.service.CategoryService;
import com.team.project.chatbot.service.ChatbotService;

@Controller
public class HomeController {
	@Autowired
	private ChatbotService chatbotService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/")
	public ModelAndView home(ModelAndView mView) {
		chatbotService.getQnaList(mView);
		categoryService.getCategoryList(mView);
		mView.setViewName("home");
		
		return mView;
	}
}
