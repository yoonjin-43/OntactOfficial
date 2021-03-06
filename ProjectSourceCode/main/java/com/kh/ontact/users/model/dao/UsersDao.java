package com.kh.ontact.users.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.users.model.dto.UsersDto;

@Repository("usersDao")
public class UsersDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public int joinPjChange(HashMap<String,String> paramMap1) throws Exception{
		return sqlSession.insert("Users.joinPjChange",paramMap1);
	}
	public int joinPjMemChange(HashMap<String,String> paramMap2) throws Exception{
		return sqlSession.insert("Users.joinPjMemChange", paramMap2);
	}
	public int joinPjDeptChange(String cno) throws Exception{
		return sqlSession.insert("Users.joinPjDeptChange", cno);
	}
	
	
	//비즈니스 회원가입
	public void joinBusiness(UsersDto dto) throws Exception{
		sqlSession.insert("Users.joinBusiness",dto);
	}
	public void joinbusdept(String dname) throws Exception{
		sqlSession.insert("Users.joinbusdept",dname);
	}
	public void joinProject(String pname) throws Exception{
		sqlSession.insert("Users.joinProject",pname);
	}
	public void joinProjectMember() throws Exception{
		sqlSession.insert("Users.joinProjectMember");
	}
	public void joinProjectDept() throws Exception{
		sqlSession.insert("Users.joinProjectDept");
	}
	public void joinCompanyProject(String pno) throws Exception{
		sqlSession.insert("Users.joinCompanyProject", pno);
	}
	
	// 이메일 중복체크
	public String emailChk(String uemail) throws Exception {
		return sqlSession.selectOne("Users.emailChk", uemail);
	}

	// 유저 회원가입
	public int joinGuest(UsersDto dto) throws Exception {
		return sqlSession.insert("Users.joinGuest", dto);
	}
	public String pnoChk(String pname) throws Exception {
		return sqlSession.selectOne("Users.pnoChk", pname);
	}
	public String joinDefaultPj(HashMap<String,String> paramMap) throws Exception {
		return sqlSession.selectOne("Users.joinDefaultPj", paramMap);
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
	// 비밀번호 변경
	public String getpwd(String uno) throws Exception {
		return sqlSession.selectOne("Users.getpwd", uno);
	}
	// 마이페이지 계정정보 업데이트
	public int updateUtell(HashMap<String, String> paramMap) {
		return sqlSession.update("Users.updateUtell",paramMap);
	}
	public int updateUrank(HashMap<String, String> paramMap) {
		return sqlSession.update("Users.updateUrank",paramMap);
	}
	// 마이페이지 프로필 변경
	public int updateProfile(HashMap<String, String> paramMap) {
		return sqlSession.update("Users.updateProfile",paramMap);
	}
	// 마이페이지 프로필 삭제
	public int deleteProfile(String uno) {
		return sqlSession.update("Users.deleteProfile",uno);
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
	
	//해당 프로젝트 유저 리스트
	public List<ProjectMemberDto> listProjectMember(String pno) throws Exception{
		return sqlSession.selectList("Users.listProjectMember", pno);
	}
	
	//프로젝트 초대 리스트
	public List<UsersDto> projectInviteList(UsersDto dto) throws Exception{
		return sqlSession.selectList("Users.projectInviteList", dto);
	}
	
	
	//혜림 - 조직도
		//미분류그룹
		public int listCountFirst(String cno) {
			return sqlSession.selectOne("Users.listCountFirst", cno);
		}
		public List<UsersDto> selectOgFirst(int startPage, int limit, String cno) { // 특정 페이지 단위의 게시글 조
			int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
			RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowbounds
			return sqlSession.selectList("Users.selectOgFirst",cno,row);
		}
		//분류그룹
		public int listCount(HashMap<String, String> paramMap) {
			return sqlSession.selectOne("Users.listCount", paramMap);
		}
		public List<UsersDto> selectOrgani(int startPage, int limit, HashMap<String, String> paramMap) { // 특정 페이지 단위의 게시글 조
			int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
			RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowbounds
			return sqlSession.selectList("Users.selectOgUser",paramMap,row);
		}
		
		//사원 부서 수정, 삭제 조건
		public int updateDept(UsersDto u) { // 글 수정 
			return sqlSession.update("Users.updateDept", u);
		}
		public List<UsersDto> deleteOrgani(HashMap<String, String> paramMap1) { // 특정 페이지 단위의 게시글 조
			System.out.println("다오까지 옴");
			return sqlSession.selectList("Users.deleteOrgani", paramMap1);
		}
		

}