package chatuser;

import java.util.ArrayList;
import java.util.List;

import chat.ChatVO;
import db.DBManager;

public class ChatuserDAO extends DBManager {
//	참여자 추가 삭제 조회
	
//	참여자 조회
	public List<ChatuserVO> selChatUser(String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from chatuser where chatno = " + chatno;
		executeQuery(sql);
		
		List<ChatuserVO> list = new ArrayList<>();
		while(next()) {
			String id = getString("id");
			
			ChatuserVO vo = new ChatuserVO();
			vo.setId(id);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	참여자 추가
	public void insertChatUser(String id, String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "insert into chatuser(id, chatno) ";
		sql += "values('" + id + "', " + chatno + ");";
		executeUpdate(sql);
		DBDisConnect();
	}
	
//	참여자 삭제
	public void deleteChatUser(String id, String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "delete from chatuser where id = '" + id + "' and chatno = " + chatno;
		executeUpdate(sql);
		DBDisConnect();
	}
}
