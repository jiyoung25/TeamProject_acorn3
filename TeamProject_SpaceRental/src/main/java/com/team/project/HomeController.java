package com.team.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.category.service.CategoryService;
import com.team.project.chatbot.service.ChatbotService;
import com.team.project.space.service.SpaceService;
import com.team.project.users.service.UsersService;

@Controller
public class HomeController {
	@Autowired
	private ChatbotService chatbotService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private SpaceService spaceService;
	
	@RequestMapping("/")
	public ModelAndView home(ModelAndView mView, HttpSession session) {
		if(session.getAttribute("id")!=null) {
			usersService.getInfo(session, mView);
		}

		spaceService.getRecentReviewList(mView);
		chatbotService.getQnaList(mView);
		categoryService.getCategory(mView);
		
		mView.setViewName("home");
		return mView;
	}
}
