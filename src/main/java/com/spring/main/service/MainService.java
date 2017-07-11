package com.spring.main.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.MainInterface;

@Service
public class MainService {

	@Autowired
	SqlSession sqlSession;
	
	MainInterface inter;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//프로필 페이지 이동
	public ModelAndView profile(String id) {
		
		ModelAndView mav = new ModelAndView();
		
		inter = sqlSession.getMapper(MainInterface.class);
		
		mav.addObject("profile", inter.profile(id));
		mav.setViewName("profile");
		
		return mav;
	}

}
