
import board.BoardDAO;
import board.BoardVO;
import chat.ChatVO;

public class Test2 {

	public static void main(String[] args) {
		ChatVO vo = new ChatVO();
		System.out.println(vo);
		
		String sql = "select board.*, user.*, count(push.bno) as push, count(hit.bno) as hit from board ";
		sql += "left join user on board.author = user.id ";
		sql += "left join push on board.bno = push.bno ";
		sql += "left join hit on board.bno = hit.bno ";
		sql += "where board.board_type != 99 or user.user_type != 2 and board.board_type = " + 1 + " group by board.bno";
		
		System.out.println(sql);
		
		
	}

}
