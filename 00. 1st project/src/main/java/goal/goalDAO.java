package goal;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;

public class goalDAO extends DBManager{

	// 1. 목표 조회
	// select * from goal where id = '?';
	public List<goalVO> selectAll(String id) {
		driverLoad();
		DBConnect();
		
		
		String sql = "";
		sql += "select *, (select sum(add_time) from timer where goalno = g.goalno) as cnt from goal g where id = '" + id + "'";
		
		executeQuery(sql);
		List<goalVO> goalList = new ArrayList<>();
		
		while(next()) {
			String goalNo = getString("goalNo");
			String goalTime = getString("goal_time");
			String goalTitle = getString("goal_title");
			String goalCont = getString("goal_cont");
			String uid = getString("id");
			int cnt = getInt("cnt");
			
			goalVO vo = new goalVO();
			vo.setGoalNo(goalNo);
			vo.setGoalTime(goalTime);
			vo.setGoalTitle(goalTitle);
			vo.setGoalCont(goalCont);
			vo.setId(uid);
			vo.setCnt(cnt);
		
			goalList.add(vo);
		}
		
		DBDisConnect();
		
		return goalList;
	}
	
	// 2. 목표 추가
	// insert into goal (goalNo, goal_time, goal_title, goal_cont, id) values (?, ?, ?, ?, ?);
	
	public int goalAdd(goalVO vo) {
		driverLoad();
		DBConnect();
		
		String goalTime = vo.getGoalTime();
		String goalTitle = vo.getGoalTitle();
		String goalCont = vo.getGoalCont();
		String id = vo.getId();
		
		String sql = "";
		sql += "insert into goal (goal_time, goal_title, goal_cont, id) ";
		sql += "values (" + goalTime + ", '" + goalTitle + "', '" + goalCont + "', '" + id + "')";
		executeUpdate(sql);
		
		String selectSql = "select last_insert_id() as goalNo";
		executeQuery(selectSql);
		
		if(next()) {
			int goalNo = getInt("goalNo");
			DBDisConnect();
			return goalNo;
		}else {
			DBDisConnect();
			return 0;
		}
		
	}
	
	
	// 3. 목표 수정
	// update goal set goal_time = , goal_title = '', goal_cont = '' where goalNo = ;
	
	public void goalModify(goalVO vo) {
		driverLoad();
		DBConnect();
		
		String goalTime = vo.getGoalTime();
		String goalTitle = vo.getGoalTitle();
		String goalCont = vo.getGoalCont();
		String goalNo = vo.getGoalNo();
		
		String sql = "";
		sql += "update goal set goal_time = "+ goalTime + ", goal_title = '" + goalTitle + "', goal_cont = '" + goalCont + "' " ;
		sql += "where goalNo = " + goalNo ;
		executeUpdate(sql);
		
		DBDisConnect();
	}
	
	// 4. 목표 삭제
	// delete from goal where goalNo = ?;
	
	public void goalDelete(String goalNo) {
		driverLoad();
		DBConnect();
		
		String sql = "delete from goal where goalNo =" + goalNo ;
		executeUpdate(sql);
		
		DBDisConnect();
		
	}
	
	public double goalCal(String id) {
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "select round((select sum(all_time)from timer where id = '" + id + "') / (sum(goal_time) *60 * 60) * 100, 2) as cal from goal where id = '" + id + "';";
		executeQuery(sql);
		if(next()) {
			double cal = getDouble("cal");
			DBDisConnect();
			return cal;
			
		}
		DBDisConnect();
		return 0;
		
	}
	
	
	
	
}








































