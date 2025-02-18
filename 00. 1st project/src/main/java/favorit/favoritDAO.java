package favorit;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class favoritDAO extends DBManager {
//	추가 삭제 조회

//	즐겨찾기 조회(여러건)
	public List<favoritVO> selFavorit(String fid){
		driverLoad();
		DBConnect();
		
		String sql = "select * from favorit where id = '" + fid + "'";
		executeQuery(sql);
		
		List<favoritVO> list = new ArrayList<>();
		while(next()) {
			String id = getString("id");
			String boarType = getString("board_type");
			
			favoritVO fvo = new favoritVO();
			fvo.setBoard_type(boarType);
			fvo.setId(id);
			
			list.add(fvo);
		}
		DBDisConnect();
		return list;
	}
	
//	즐겨찾기 조회(단건)
	public int selFavoritOne(String fid, String boardType){
		driverLoad();
		DBConnect();
		
		String sql = "select count(*) as count from favorit where id = '" + fid + "' and board_type = " + boardType;
		executeQuery(sql);
		
		if(next()) {
			int count = getInt("count");
			DBDisConnect();
			return count;
		}
		DBDisConnect();
		return 0;
	}
	
//	즐겨찾기 클릭시
	public void clickFavorit(String id, String boardType) {
		driverLoad();
		DBConnect();
		
		String select = "select * from favorit where id = '" + id + "' and board_type = " + boardType;
		executeQuery(select);
		
		if(next()) {
			String sql = "delete from favorit where id = '" + id + "' and board_type = " + boardType;
			executeUpdate(sql);
		}else {
			String sql = "insert into favorit(id, board_type) ";
			sql += "values('" + id + "', " + boardType + ");";
			executeUpdate(sql);
		}
		
		DBDisConnect();
	}
	
	

}
