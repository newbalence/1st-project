package reply;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class ReplyDAO extends DBManager {
//	댓글 쓰기 조회 수정 삭제
	
//	댓글 작성
	public int write(ReplyVO vo) {
		String rauthor = vo.getRauthor();
		String rcontent = vo.getRcontent();
		String bno = vo.getBno();
		
		driverLoad();
		DBConnect();
		
		String sql = "insert into reply(rauthor, rcontent, bno) ";
		sql += "values('" + rauthor + "', '" + rcontent + "', " + bno + ");";
		executeUpdate(sql);
		
		String lastNum = "select last_insert_id() as rno;";
		executeQuery(lastNum);
		
		if(next()) {
			int rno = getInt("rno");
			DBDisConnect();
			return rno;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
//	댓글 조회
	public List<ReplyVO> selReplyAll(String bno){
		driverLoad();
		DBConnect();
		
		String sql = "select* from reply left join user on "; 
		sql += "reply.rauthor = user.id ";
		sql += "where bno = " + bno + " order by rno desc;";
		executeQuery(sql);
		
		List<ReplyVO> list = new ArrayList<>();
		while(next()) {
			String rno = getString("rno");
			String rauthor = getString("rauthor");
			String rcontent = getString("rcontent");
			String createDate = getString("create_date");
			String updateDate = getString("update_date");
			String userType = getString("user_type");
			
			ReplyVO vo = new ReplyVO();
			vo.setRno(rno);
			vo.setRauthor(rauthor);
			vo.setRcontent(rcontent);
			vo.setCreateDate(createDate);
			vo.setUpdateDate(updateDate);
			vo.setUserType(userType);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	댓글 수정
	public void modify(ReplyVO vo) {
		String rno = vo.getRno();
		String rcontent = vo.getRcontent();
		
		driverLoad();
		DBConnect();
		
		String sql = "update reply set rcontent = " + rcontent;
		sql += ", update_date = now() where rno = " + rno;
		executeUpdate(sql);
		
		DBDisConnect();
	}
	
//	댓글 삭제
	public void dropReply(String rno) {
		driverLoad();
		DBConnect();
		
		String sql = "delete from reply where rno = " + rno;
		executeUpdate(sql);
		
		DBDisConnect();
	}
	
	
}
