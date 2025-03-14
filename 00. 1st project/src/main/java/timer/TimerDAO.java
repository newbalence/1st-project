package timer;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class TimerDAO extends DBManager {
//	타이머 조회 시작 종료
	
//	타이머 조회(단건)
	public int selTimeone(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select * from timer where id = '" + id + "';";
		executeQuery(sql);
		
		if(next()) {
			int allTime = getInt("all_time");
			
			DBDisConnect();
			return allTime;
		}
		DBDisConnect();
		return 0;
	}
	
//	타이머 조회(전체)
	public List<TimerVO> selTime(String no) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from timer where goalno = "+no+";";
		executeQuery(sql);
		
		List<TimerVO> list = new ArrayList<>();
		while(next()) {
			String timeno = getString("timeno");
			String id = getString("id");
			String startTime = getString("start_time");
			String endTime = getString("end_time");
			int allTime = getInt("all_time");
			int addTime = getInt("add_time");
			
			TimerVO vo = new TimerVO();
			vo.setTimeNO(timeno);
			vo.setId(id);
			vo.setStartTime(startTime);
			vo.setEndTime(endTime);
			vo.setAllTime(allTime);
			vo.setAddTime(addTime);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	타이머 시작
	public int startTime(String uid, String no) {
		driverLoad();
		DBConnect();
		
		String sql = "insert into timer(id, start_time, goalno) values('" + uid + "', now(), "+no+");";
		executeUpdate(sql);
		
		String lastNum = "select last_insert_id() as num";
		executeQuery(lastNum);
		
		if(next()) {
			int num = getInt("num");
			DBDisConnect();
			return num;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
//	타이머 종료
	public TimerVO endTime(String num, String time, String uid, String no) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "update timer "; 
		sql += "set end_time = now(), "; 
		sql += "all_time = " + time;
		sql += ", add_time = (select sun from (select IFNULL(sum(all_time), 0) + " + time + " as sun from timer where id='" + uid + "' and goalno = " + no + ") as t) "; 
		sql += "where timeno = " + num;
		executeUpdate(sql);
		
		String selectSql = "select * from timer where timeno = " + num;
		executeQuery(selectSql);
		
		if(next()) {
			String timeno = getString("timeno");
			String id = getString("id");
			String startTime = getString("start_time");
			String endTime = getString("end_time");
			int allTime = getInt("all_time");
			int addTime = getInt("add_time");
			
			TimerVO vo = new TimerVO();
			vo.setTimeNO(timeno);
			vo.setId(id);
			vo.setStartTime(startTime);
			vo.setEndTime(endTime);
			vo.setAllTime(allTime);
			vo.setAddTime(addTime);
			
			DBDisConnect();
			
			return vo;
		}
		DBDisConnect();
		return null;
	}
	
	
}
