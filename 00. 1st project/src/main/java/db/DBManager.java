package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//DBManager db = new DBManager();
public class DBManager {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	//메서드를 이용해서 데이터베이스 드라이버를 연결하고
	//mysql 서버와 연결하고
	//쿼리를 실행하고
	//자원을 회수하기 위해서 별도의 클래스를 생성
	
	//1. 드라이버 로딩
	public void driverLoad() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//2. 데이터베이스 연결
	public void DBConnect() {
		String url = "jdbc:mysql://localhost:3306/god";
		String user = "root";
		String pw = "ezen";
		try {
			conn = DriverManager.getConnection(url, user, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//3. 쿼리 실행객체 생성
	//4. insert, update, delete 쿼리 실행
	//메서드를 실행할 때, 실행할 쿼리를 메서드의 파라미터로 입력
	public void executeUpdate(String sql) {
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//3. 쿼리 실행 객체 생성
	//4. select 쿼리 실행
	//select * from board;
	//db.executeQuery("select * from board;");
	public void executeQuery(String sql) {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//executeQuery 메서드가 실행되고난 후 조회된 데이터를 rs 필드에 대입하고
	//rs필드는 next 메서드를 호출하여 조회된 데이터의 커서를 다음행으로 이동하면서
	//데이터를 꺼내와야한다.
	//rs의 커서를 다음행으로 이동시키는 메서드
	//db.executeQuery("select * from board;");
	//db.rs가 데이터를 가지고있고.
	//db.next()메서드를 실행하면 
	//db.rs의 커서가 다음행으로 이동
	public boolean next() {
		try {
			boolean result = rs.next();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//next 메서드를 이용해서 rs의 커서를 다음행으로 이동한 후
	//rs 커서가 가르키고있는 행에서 데이터를 꺼내오기위한 메서드
	//String data = db.getString("id");
	public String getString(String value) {
		try {
			String result = rs.getString(value);
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	//int data = db.getInt("bno");
	public int getInt(String value) {
		try {
			int result = rs.getInt(value);
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//5. 자원 회수(해제)
	public void DBDisConnect() {
		try {
			if(rs != null) {
				rs.close();
			}
			
			if(stmt != null) {
				stmt.close();
			}
			
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
