package com.bit.companion.model.login;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.model.entity.login.LoginVo;
import com.bit.companion.model.entity.login.MemberVo;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean loginChk(LoginVo bean) {
		String name=sqlSession.selectOne("login.loginChk",bean);
		return (name==null) ? false : true;
	}

	@Override
	public MemberVo infoLogin(LoginVo bean) {
		return sqlSession.selectOne("login.loginInfo",bean);
	}

	@Override
	public void logout(HttpSession session) {
		
	}

	@Override
	public int findIDCheck(String name_check, String phone_check) {
		HashMap<String,String> idInfo=new HashMap<>();
		idInfo.put("name_check", name_check);
		idInfo.put("phone_check", phone_check);
		return sqlSession.selectOne("login.findIDCheck",idInfo);
	}

	@Override
	public String findIDresult(String name_check, String phone_check) {
		HashMap<String,String> idInfo=new HashMap<>();
		idInfo.put("name_check", name_check);
		idInfo.put("phone_check", phone_check);
		return sqlSession.selectOne("login.findID",idInfo);
	}

	@Override
	public int findPWCheck(String name_check, String id_check, String email_check) {
		HashMap<String,String> pwInfo=new HashMap<>();
		pwInfo.put("name_check", name_check);
		pwInfo.put("id_check", id_check);
		pwInfo.put("email_check", email_check);
		return sqlSession.selectOne("login.findPWCheck",pwInfo);
	}

	@Override
	public void updateRandomPW(String name_check, String id_check, String email_check, String randomPW) {
		HashMap<String,String> pwInfo=new HashMap<>();
		pwInfo.put("name_check", name_check);
		pwInfo.put("id_check", id_check);
		pwInfo.put("email_check", email_check);
		pwInfo.put("randomPW", randomPW);
		sqlSession.update("login.updateRandomPW", pwInfo);
	}

}
