package chat;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class ChatDAO extends DBManager {
//	채팅 추가 조회 삭제
	
//	채팅 추가
	public int insertChat(ChatVO vo) {
		String chatnum = vo.getChatroomno();
		String id = vo.getId();
		String chatcontent = vo.getChatcontent();
		String nick = vo.getSender();
		driverLoad();
		DBConnect();
		
		String sql = "insert into chat(chatroomno, sender, chatcontent, chattime, nick) ";
		sql += "values(" + chatnum + ", '" + id + "', '" + chatcontent + "', now(), '" + nick + "')";
		executeUpdate(sql);
		
		String lastNum = "select last_insert_id() as num;";
		executeQuery(lastNum);
		
		if(next()) {
			int num = getInt("num");
			DBDisConnect();
			return num;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
//	채팅 조회
	public List<ChatVO> selChat(String num) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from chat where chatroomno = " + num;
		executeQuery(sql);
		
		List<ChatVO> list = new ArrayList<>();
		while(next()) {
			String chatnum = getString("chatnum");
			String chatno = getString("chatroomno");
			String sender = getString("nick");
			String chatContent = getString("chatcontent");
			String chatTime = getString("chattime");
			String id = getString("sender");
			
			ChatVO vo = new ChatVO();
			vo.setChatno(chatnum);
			vo.setChatroomno(chatno);
			vo.setSender(sender);
			vo.setChatcontent(chatContent);
			vo.setChattime(chatTime);
			vo.setId(id);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	채팅 삭제
	public void deleteChat(String sender, String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "delete from chat where sender = '" + sender + "' and chatno = " + chatno;
		executeUpdate(sql);
		DBDisConnect();
	}
	
}
