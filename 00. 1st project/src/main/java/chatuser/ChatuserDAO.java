package chatuser;

import java.util.ArrayList;
import java.util.List;

import chat.ChatVO;
import db.DBManager;

public class ChatuserDAO extends DBManager {
//	참여자 추가 삭제 조회
	
//	사용자가 채팅방에 있는지 확인
	public int userCheck(String id, String no) {
		driverLoad();
		DBConnect();
		
		String sql = "select count(*) as count from chatuser where id = '" + id + "' and chatroomno = " + no;
		executeQuery(sql);
		
		if(next()) {
			int count = getInt("count");
			return count;
		}
		return 0;
	}
	
//	참여자 조회
	public List<ChatuserVO> selChatUser(String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from chatuser where chatroomno = " + chatno;
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
	
//	참여자 수 조회
	public int countChatUser(String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "select count(*) as count from chatuser where chatroomno = " + chatno;
		executeQuery(sql);
		
		if(next()) {
			int count = getInt("count");
			return count;
		}
		DBDisConnect();
		return 0;
	}
	
//	참여자 추가
	public void insertChatUser(String id, String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "insert into chatuser(id, chatroomno) ";
		sql += "values('" + id + "', " + chatno + ");";
		executeUpdate(sql);
		DBDisConnect();
	}
	
//	참여자 삭제
	public void deleteChatUser(String id, String chatno) {
		driverLoad();
		DBConnect();
		
		String sql = "delete from chatuser where id = '" + id + "' and chatroomno = " + chatno;
		executeUpdate(sql);
		DBDisConnect();
	}
}
