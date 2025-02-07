import board.BoardVO;

public class test {

	public static void main(String[] args) {
		
		BoardVO bvo = new BoardVO();
		bvo.setAuthor("집가고 싶은 사람");
		bvo.setTitle("안녕하세요");
		bvo.setContent("집가고 싶어요");
		bvo.setBoardType("1");
		bvo.setBno("3");
		
		bvo.setOriginName("오리진이름");
		bvo.setUploadname("업로드 이름");
		bvo.setLocation("우리집");
		bvo.setFileSize(1);
		
		String author = bvo.getAuthor();
		String title = bvo.getTitle();
		String content = bvo.getContent();
		String boardType = bvo.getBoardType();
		String bno = bvo.getBno();
		String searchType = "";
		String keyword = "";
		int startNum = 0;
		int limitSize = 10;
		//첨부파일
		String originName = bvo.getOriginName();
		String uploadName = bvo.getUploadname();
		String location = bvo.getLocation();
		long fileSize = bvo.getFileSize();

//		
//		String sql = "select * from board left join user on board.author = user.id where board_type != 99";
//		if(searchType != null && keyword != null) {
//			sql += " and " + searchType + " like '%" + keyword + "%'";
//		}
//		sql += " order by no desc";
//		sql += " limit " + startNum + ", " + limitSize;

		String sql = "select board.*, user.*, count(push.bno) as cnt from board ";
		sql += "left join user on board.author = user.id ";
		sql += "left join push on board.bno = push.bno ";
		sql += "where board_type != 99 or user_type != 2 group by board.bno";
//		sql += " order by board.bno desc;";
		sql += " order by cnt desc;";
		System.out.println(sql);
	}

}
