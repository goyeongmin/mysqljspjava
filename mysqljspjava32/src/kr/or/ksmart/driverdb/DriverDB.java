package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	// 1단계)드라이버 로딩 과 2단계)DB연결 후 Connection객체 주소값을 리턴하는 메서드 선언
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("############################");
		System.out.println("01 driverDbcon DriverDB.java");
		System.out.println("############################");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/db04gym?" + "useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid04gym";
		String dbPass = "dbpw04gym";
		Connection reconn = null;
		reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(reconn + "<-- reconn driverDbcon DriverDB.java");
		return reconn;
	}

}
