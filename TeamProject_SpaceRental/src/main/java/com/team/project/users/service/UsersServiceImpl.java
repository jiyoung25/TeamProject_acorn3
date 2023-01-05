package com.team.project.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.users.dao.UsersDao;

@Service
public class UsersServiceImpl {
	@Autowired
	private UsersDao dao;
}
