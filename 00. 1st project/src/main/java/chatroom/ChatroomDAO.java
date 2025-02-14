package chatroom;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class ChatroomDAO extends DBManager {
//	채팅방 추가 삭제 조회
	
//	채팅방 조회
	public List<ChatroomVO> selChatRoom(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from chatroom where chatroomno in(select chatroomno from chatuser where id = '" + id + "') and chat_type != 99 ";
		sql += "union ";
		sql += "select * from chatroom where chatroomno not in(select chatroomno from chatuser where id = '" + id + "') and chat_type != 99;";
		executeQuery(sql);
		
		List<ChatroomVO> list = new ArrayList<>();
		while(next()) {
			String chatno = getString("chatroomno");
			String chatname = getString("chatname");
			
			ChatroomVO vo = new ChatroomVO();
			vo.setChatname(chatname);
			vo.setChatroomno(chatno);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	내가 들어가있는 채팅방 조회
	public List<ChatroomVO> userChatRoom(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from chatroom where chatroomno in(select chatroomno from chatuser where id = '" + id + "') and chat_type != 99 ";
		sql += "limit 0, 3";
		executeQuery(sql);
		
		List<ChatroomVO> list = new ArrayList<>();
		while(next()) {
			String chatno = getString("chatroomno");
			String chatname = getString("chatname");
			
			ChatroomVO vo = new ChatroomVO();
			vo.setChatname(chatname);
			vo.setChatroomno(chatno);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	채팅방 추가
	public String insertChatRoom(String chatname) {
		driverLoad();
		DBConnect();
		
		String sql = "insert into chatroom(chatname) values('" + chatname + "');";
		executeUpdate(sql);
		
		String lastNum = "select last_insert_id() as num";
		executeQuery(lastNum);
		
		if(next()) {
			String num = getString("num");
			DBDisConnect();
			return num;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	채팅방 수정
	public void updateChatRoom(String chatno, String chatname) {
		driverLoad();
		DBConnect();
		
		String sql = "update cahtroom set chatname = " + chatname;
		sql += " where chatno = " + chatno;
		executeUpdate(sql);
		DBDisConnect();
	}
	
//	채팅방 삭제
	public void deleteChatRoom(String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "update chatroom set chat_type = 99;";
		executeUpdate(sql);
		DBDisConnect();
	}
	
	
	
}
