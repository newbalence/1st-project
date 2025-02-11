package board;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class BoardDAO extends DBManager {
	//작성 수정 삭제 조회(단건, 여러건)
	
	//게시글 작성
	public int insertBoard(BoardVO vo) {
		String author = vo.getAuthor();
		String title = vo.getTitle();
		String content = vo.getContent();
		String boardType = vo.getBoardType();
		
		//첨부파일
		String originName = vo.getOriginName();
		String uploadName = vo.getUploadname();
		String location = vo.getLocation();
		long fileSize = vo.getFileSize();
		
		driverLoad();
		DBConnect();
		
		String sql = "insert into board(author, title, content, board_type, ";
		sql += "origin_name, upload_name, location, file_size) ";
		sql += "values('" + author + "', '" + title + "', '" + content + "', " + boardType + ", ";
		sql += "'" + originName + "', '" + uploadName + "', '" + location + "', " + fileSize + ");";
		
		executeUpdate(sql);
		
		String num = "select last_insert_id() as bno";
		executeQuery(num);
		
		if(next()) {
			int no = getInt("bno");
			DBDisConnect();
			return no;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
	//게시글 수정
	public void updateBoard(BoardVO vo) {
		String title = vo.getTitle();
		String content = vo.getContent();
		String bno = vo.getBno();
		
		String originName = vo.getOriginName();
		String uploadName = vo.getUploadname();
		String location = vo.getLocation();
		long fileSize = vo.getFileSize();
		
		driverLoad();
		DBConnect();
		
		String sql = "update board set ";
		if(title != null) {
			sql += "title = '" + title + "', ";
		}
		if(content != null) {
			sql += "content = '" + content + "', ";
		}
		if(originName != null) {
			sql += "origin_name = '" + originName + "', ";
			sql += "upload_name = '" + uploadName + "', ";
			sql += "location = '" + location + "', ";
			sql += "file_size = " + fileSize;
		}
		sql += "update_date = now() ";
		sql += "where bno = " + bno;
		executeUpdate(sql);
		DBDisConnect();
	}
	
	
	//글 삭제
	public void deleteBoard(String bno) {
		driverLoad();
		DBConnect();
		
		String sql = "update board set update_date = now(), board_type = 99 where bno = " + bno;
		executeUpdate(sql);
		DBDisConnect();
	}
	
	//글 조회(여러건)
	public List<BoardVO> selBoardAll(SearchVO svo){
		String searchType = svo.getSearchType();
		String keyword = svo.getKeyword();
		int startNum = svo.getStartNum();
		int limitSize = svo.getLimitSize();
		String selectlist = svo.getSelectlist();
		String boardType = svo.getBoardType();
		
		driverLoad();
		DBConnect();
		
		String sql = "select board.*, user.*, (select count(*) from push where bno = board.bno) as push, (select count(*) from hit where bno = board.bno) as hit from board ";
		sql += "left join user on board.author = user.id ";
		sql += "where (board.board_type != 99 and user.user_type != 2)";
		
		if(boardType != null && !boardType.equals("") && !boardType.equals("null")) {
			 sql += " and board.board_type = " + boardType; 
		}
		if(searchType != null && keyword != null) {
			sql += " and " + searchType + " like '%" + keyword + "%'";
		}
		sql += " group by board.bno";
		if(selectlist != null && !selectlist.equals("") && !selectlist.equals("null")) {
			if(selectlist.equals("push")) {
				sql += " order by push desc";
			}else if(selectlist.equals("old")) {
				sql += "";
			}
		}else {
			sql += " order by board.bno desc";
		}
		
		sql += " limit " + startNum + ", " + limitSize;
		executeQuery(sql);
		
		List<BoardVO> list = new ArrayList<>();
		while(next()) {
			String bno = getString("bno");
			String author = getString("author");
			String nick = getString("nick");
			String title = getString("title");
			String createDate = getString("create_date");
			String updateDate = getString("update_date");
			String userType = getString("user_type");
			int hit = getInt("hit");
			int push = getInt("push");
			String bordType = getString("board_type");
			
			BoardVO vo = new BoardVO();
			vo.setBno(bno);
			vo.setAuthor(author);
			vo.setNick(nick);
			vo.setTitle(title);
			vo.setCreateDate(createDate);
			vo.setUpdateDate(updateDate);
			vo.setUserType(userType);
			vo.setPush(push);
			vo.setHit(hit);
			vo.setBoardType(bordType);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//글 조회(단건)
	public BoardVO selBoardOne(String no, String user) {
		driverLoad();
		DBConnect();
		
		String sql = "select *, (select count(*) from push where user = '" + user + "' and bno = " + no + ") as cnt, ";
		sql += "(select count(*) from push where bno = " + no + ") as push ";
		sql += "from board where board_type != 99";
		sql += " and bno = " + no;
		
		executeQuery(sql);
		
		if(next()) {
			String bno = getString("bno");
			String author = getString("author");
			//String nick = getString("nick");
			String title = getString("title");
			String content = getString("content");
			String createDate = getString("create_date");
			String updateDate = getString("update_date");
			String originName = getString("origin_name");
			String uploadName = getString("upload_name");
			int fileSize = getInt("file_size");
			int userPush = getInt("cnt");
			int push = getInt("push");
			
			
			BoardVO vo = new BoardVO();
			vo.setBno(bno);
			vo.setAuthor(author);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setCreateDate(createDate);
			vo.setUpdateDate(updateDate);
			vo.setOriginName(originName);
			vo.setUploadname(uploadName);
			vo.setFileSize(fileSize);
			vo.setUserPush(userPush);
			vo.setPush(push);
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	//게시글 개수 조회
	public int getcount(SearchVO svo) {
		String searchType = svo.getSearchType();
		String keyword = svo.getKeyword();
		String boardType = svo.getBoardType();
		driverLoad();
		DBConnect();
		
		String sql = "select count(board.bno) as cnt from board left join user on board.author = user.id ";
		sql += "where (board.board_type != 99 and user.user_type != 2)";
		if(boardType != null && !boardType.equals("") && !boardType.equals("null")) {
			 sql += " and board.board_type = " + boardType; 
		}
		if(searchType != null && keyword != null) {
			sql += " and " + searchType + " like '%" + keyword + "%'";
		}
		
		executeQuery(sql);
		
		if(next()) {
			int count = getInt("cnt");
			DBDisConnect();
			
			return count;
		}else{
			DBDisConnect();
			return 0;
		}
	}
	
	//탈퇴 유저 게시글 삭제
	public void dropBoard(String author) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "update board set board_type = 99, update_date = now() ";
		sql += "where author = '" + author + "';";
		executeUpdate(sql);
		
		DBDisConnect();
	}
}
