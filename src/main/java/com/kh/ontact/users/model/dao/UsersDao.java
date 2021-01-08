package com.kh.ontact.users.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.users.model.dto.UsersDto;

@Repository("usersDao")
public class UsersDao {
	@Autowired
	private SqlSession sqlSession;
	
	//비즈니스 회원가입
	public void joinBusiness(UsersDto dto) throws Exception{
		sqlSession.insert("Users.joinBusiness",dto);
	}
	
// 이메일 중복체크
	public String emailChk(String uemail) throws Exception {
		return sqlSession.selectOne("Users.emailChk", uemail);
	}

	// 유저 회원가입
	public int joinGuest(UsersDto dto) throws Exception {
		return sqlSession.insert("Users.joinGuest", dto);
	}

	// 임시비밀번호 확인
	public String pwdChk(UsersDto userdto) throws Exception {
		return sqlSession.selectOne("Users.pwdChk", userdto);
	}
	// 임시비밀번호 업데이트
	public int updateTmppwd(UsersDto dto) throws Exception{
		System.out.println("가져온비밀번호:"+dto.getUpwd());
		System.out.println("가져온이메일:"+dto.getUemail());
		return sqlSession.update("Users.updateTmppwd",dto);
	}

	
	
	
	
	
	
	/* 아래부터 혜원 채팅 관련 코드 */
	
	//cno에 해당되는 유저 리스트
	public List<UsersDto> ChatUsersList(UsersDto dto) throws Exception{
		return sqlSession.selectList("Users.ChatUsersList", dto);
	}
	
	//uemail에 해당되는 유저 정보
	public UsersDto ChatUserDetail(String uemail) throws Exception{
		return sqlSession.selectOne("Users.ChatUserDetail", uemail);
	}

}