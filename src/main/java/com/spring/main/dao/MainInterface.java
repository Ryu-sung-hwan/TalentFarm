package com.spring.main.dao;

import com.spring.main.beans.MemberBean;

public interface MainInterface {

	//프로필 페이지 이동
	MemberBean profile(String id);

}
