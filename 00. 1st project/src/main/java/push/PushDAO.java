package push;

import db.DBManager;

public class PushDAO extends DBManager {
//	추천수 조회 추가 삭제
	
//	추천 조회
	public int selPush(String bno) {
		driverLoad();
		DBConnect();
		
		String sql = "select count(*) as num from push where bno = " + bno;
		executeQuery(sql);
		
		if(next()) {
			int num = getInt("num");
			DBDisConnect();
			return num;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
//	추천 클릭시
	public void insertPush(String user, String bno) {
		driverLoad();
		DBConnect();
		
		String select = "select * from push where bno = " + bno + " and user = '" + user + "';";
		executeQuery(select);
		
		if(next()) {
			String sql = "delete from push where user = '" + user + "' and bno = " + bno;
			executeUpdate(sql);
		}else {		
			String sql = "insert into push (user, bno) ";
			sql += "values('"+ user + "', " + bno + ");";
			executeUpdate(sql);
		}
		DBDisConnect();
	}
	
	
	
	
}
