package user;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class UserDAO extends DBManager {
	
	//회원가입
	public void join(UserVO vo) {
		String id = vo.getId();
		String pw = vo.getPw();
		String name = vo.getName();
		String nick = vo.getNick();
		String email = vo.getEmail();
		String gender = vo.getGender();
		String hobby = vo.getHobby();
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "insert into user (id, pw, name, nick, email, gender, hobby) ";
		sql += "values('" + id + "', md5('" + pw + "'), '" + name + "', '" + nick + "', ";
		sql += "'" + email + "', '" + gender + "', " + hobby + ");";
		executeUpdate(sql);
		
		DBDisConnect();
	}
	
	
	//로그인
	public UserVO login(UserVO uvo) {
		
		String id = uvo.getId();
		String pw = uvo.getPw();
		String xlocation = uvo.getxLocation();
		String ylocation = uvo.getyLocaton();
		
		driverLoad();
		DBConnect();
		
		String sql = "select * from user where id = '" + id + "' and pw = md5('" + pw + "') ";
		sql += "and (user_type != 2 or user_type != 99)";

		
		executeQuery(sql);
		
		if(next()) {
			String uid = getString("id");
			String name = getString("name");
			String nick = getString("nick");
			String email = getString("email");
			String gender = getString("gender");
			String hobby = getString("hobby");
			String createDate = getString("create_date");
			String updateDate = getString("update_date");
			String deleteDate = getString("delete_date");
			String lastPw = getString("last_pw");
			String userType = getString("user_type");
			
			UserVO vo = new UserVO();
			vo.setId(uid);
			vo.setName(name);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setGender(gender);
			vo.setHobby(hobby);
			vo.setCreateDate(createDate);
			vo.setUpdateDate(updateDate);
			vo.setDeleteDate(deleteDate);
			vo.setLastPw(lastPw);
			vo.setUserType(userType);
			vo.setxLocation(xlocation);
			vo.setyLocaton(ylocation);
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	//회원정보 수정
	public void modify(UserVO vo) {
		String id = vo.getId();
		String pw = vo.getPw();
		String nick = vo.getNick();
		String hobby = vo.getHobby();
		String userType = vo.getUserType();
		
		driverLoad();
		DBConnect();
		
		String sql = "update user set update_date = now()";
		if(pw != null && !pw.isEmpty()) {
			sql += ", pw = md5('" + pw + "')";
		}
		if(nick != null	&& !nick.isEmpty()) {
			sql += ", nick = '" + nick + "'";
		}
		if(hobby != null && !hobby.isEmpty()) {
			sql += ", hobby = " + hobby;
		}
		if(userType != null && !userType.isEmpty()) {
			sql += ", user_type = " + userType;
		}
		sql +=  " where id = '" + id + "';";
		
		executeUpdate(sql);
		
		DBDisConnect();
	}
	
	//회원 등급수정
	public void delete (String id, int no) {
		driverLoad();
		DBConnect();
		
		String sql = "update user set user_type = " + no;
		if(no == 2) {
			sql += ", delete_date = now() ";
		}
		sql +=  " where id = " + id;
		executeUpdate(sql);
		DBDisConnect();
	}
	
	//아이디 중복체크
	public int idCheck(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from user where id = '" + id + "'";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 1;
		}
	}
	
	//닉네임 중복체크
	public int nickCheck(String nick) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from user where nick = '" + nick + "'";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 1;
		}
	}
	
	//회원 목록 조회
	public List<UserVO> getAllUser(){
		//회원관리 페이지에서 조회하는 유저 목록
		driverLoad();
		DBConnect();
		
		String sql = "select * from user order by user_type;";
		executeQuery(sql);
		
		List<UserVO> list = new ArrayList<>(); 
		while(next()) {
			UserVO vo = new UserVO();
			String id = getString("id");
			String name = getString("name");
			String nick = getString("nick");
			String email = getString("email");
			String hobby = getString("hobby");
			String userType = getString("user_Type");
			
			
			vo.setId(id);
			vo.setName(name);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setHobby(hobby);
			vo.setUserType(userType);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
}
