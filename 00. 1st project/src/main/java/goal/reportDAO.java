package goal;

import db.DBManager;

public class reportDAO extends DBManager {

	
	// 1. 집중 횟수
	// select count(*) from timer where id = '?';
	public int focusCount(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from timer where id = '"+ id +"'";
		executeQuery(sql);
		
		if(next()) {
			int count = getInt("cnt");
			DBDisConnect();
			return count;
		} else {
			DBDisConnect();
			return 0;			
		}
	}
	
	
	// 2. 집중 시간 focusTime
	// select sum(add_time) from timer where id = '?';
	public int focusTime(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select round(sum(add_time) / 60) as sum from timer where id = '" + id + "'";
		executeQuery(sql);
		
		if(next()) {
			int sum = getInt("sum");
			DBDisConnect();
			return sum;
		} else {
			DBDisConnect();
			return 0;
		}
		
	}
	
	
	// 3. 완료한 목표 개수 completeCount
	 /* select count(*) 
	 * from goal g where goal_time < ((select sum(add_time) from timer 
	 * where goalno = g.goalno) / 60 / 60) and id = '?'; */
	public int completeCount(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from goal g where goal_time <= ((select sum(add_time) from timer where goalno = g.goalno) / 60 / 60) and id = '"+ id +"'";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		} else {
			DBDisConnect();
			return 0;
		}
		
	}
	
	
	
	// 4. 평균 집중 시간 timeAvg
	// select avg(all_time) from timer where id = '?';
	public int timeAvg(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select round(avg(all_time) / 60) as avg from timer where id = '"+ id +"'";
		executeQuery(sql);
		
		if(next()) {
			int avg = getInt("avg");
			DBDisConnect();
			return avg;
		} else {
			DBDisConnect();
			return 0;
		}
		
	}
	
	
	
	
	// 5. 이번 달 집중 횟수 countMonth
	// select count(*) from timer where month(start_time) = month(now()) and id = '?';
	public int countMonth(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(*) as cnt from timer where month(start_time) = month(now()) and id = '"+ id +"'";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		} else {
			DBDisConnect();
			return 0;
		}
	}
	
	// 6. 이번 달 집중 시간 timeMonth
	// select sum(add_time) from timer where month(start_time) = month(now()) and id = '?';
	public int timeMonth(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select round(sum(add_time) / 60) as sum from timer where month(start_time) = month(now()) and id = '"+ id +"'";
		executeQuery(sql);

		if(next()) {
			int sum = getInt("sum");
			DBDisConnect();
			return sum;
		} else {
			DBDisConnect();
			return 0;
		}
	}
	
	// 7. 이번 달 집중한 날 dayMonth
	// select count(distinct day(start_time)) from timer where month(start_time) = month(now());
	public int dayMonth(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select count(distinct day(start_time)) as cnt from timer where month(start_time) = month(now()) and id = '" + id + "'";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		} else {
			DBDisConnect();
			return 0;
		}
	}
	
	// 8. 이번 달 평균 집중 시간 avgMonth
	// select avg(all_time) from timer where month(start_time) = month(now()) and id = '?';
	public int avgMonth(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "select round(avg(all_time) / 60) as avg from timer where month(start_time) = month(now()) and id = '"+ id +"'";
		executeQuery(sql);
		
		if(next()) {
			int avg = getInt("avg");
			DBDisConnect();
			return avg;
		} else {
			DBDisConnect();
			return 0;
		}
		
	}
}































