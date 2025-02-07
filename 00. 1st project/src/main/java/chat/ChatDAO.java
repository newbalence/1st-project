package chat;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class ChatDAO extends DBManager {
//	채팅 추가 조회 삭제
	
//	채팅 추가
	public int insertChat(ChatVO vo) {
		String chatno = vo.getChatroomno();
		String sender = vo.getSender();
		String chatcontent = vo.getChatcontent();
		driverLoad();
		DBConnect();
		
		String sql = "insert into chat(chatno, sender, chatcontent) ";
		sql += "values(" + chatno + ", '" + sender + "', '" + chatcontent + "')";
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
		
		String sql = "select * from chat where chatno = " + num;
		executeQuery(sql);
		
		List<ChatVO> list = new ArrayList<>();
		while(next()) {
			String chatnum = getString("chatnum");
			String chatno = getString("chatno");
			String sender = getString("sender");
			String chatContent = getString("chatcontent");
			String chatTime = getString("chattime");
			
			ChatVO vo = new ChatVO();
			vo.setChatnum(chatnum);
			vo.setChatroomno(chatno);
			vo.setSender(sender);
			vo.setChatcontent(chatContent);
			vo.setChattime(chatTime);
			
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
