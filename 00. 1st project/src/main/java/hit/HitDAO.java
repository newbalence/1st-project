package hit;

import db.DBManager;

public class HitDAO extends DBManager {
//	조회수 증가 조회
	
//	조회수 조회
	public int selHit(String bno) {
		driverLoad();
		DBConnect();
		
		String sql = "select count(*) as num from hit where bno = " + bno;
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
	
//	조회수 증가
	public void insertHit(String user, String bno) {
		driverLoad();
		DBConnect();
		
		String select = "select * from hit where bno = " + bno + " and user = '" + user + "';";
		executeQuery(select);
		
		if(!next()) {
			String sql = "insert into hit (user, bno) ";
			sql += "values('"+ user + "', " + bno + ");";
			executeUpdate(sql);
		}
		
		DBDisConnect();
	}
	
	
}
