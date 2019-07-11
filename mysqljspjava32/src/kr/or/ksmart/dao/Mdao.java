package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.User;

public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	User u = null;
	ResultSet rs = null;
	ArrayList<User> alm = null;
	
	
	
	//08 세션에 셋팅하기 위한 메서드 선언(아이디,이름,권한)
	public User uGetForSession(String u_id) throws SQLException, ClassNotFoundException {
		System.out.println("08 세션에 셋팅하기 위한 메서드 선언 uGetForSession Mdao.java");
        System.out.println("uGetForSession 호출 완료");
        
        DriverDB db = new DriverDB();
        conn = db.driverDbcon(); 
        
        pstmt = conn.prepareStatement("select u_id, u_level, u_name, u_email, u_phone, u_addr from tb_user where u_id=?"); 
        pstmt.setString(1, u_id);
        rs = pstmt.executeQuery();
        
        User u = new User();
        
        if(rs.next()) { 
            u.setU_id(rs.getString("u_id"));
            u.setU_level(rs.getString("u_level"));
            u.setU_name(rs.getString("u_name"));
            u.setU_name(rs.getString("u_email"));
            u.setU_name(rs.getString("u_phone"));
            u.setU_name(rs.getString("u_addr"));
    	}
		rs.close();
		pstmt.close();
		conn.close();
		return u;
	}
        




	
	// 07 로그인 체크 메서드 선언
	public String uLoginCheck(String u_id, String u_pw) throws ClassNotFoundException, SQLException {
		System.out.println("07 로그인 체크 메서드 선언 uLoginCheck Mdao.java");

		DriverDB db = new DriverDB();
		conn = db.driverDbcon();

		pstmt = conn.prepareStatement("select u_pw from tb_user where u_id=?");
		pstmt.setString(1, u_id);
		rs = pstmt.executeQuery();

		String rt = null;

		if (rs.next()) {
			if (rs.getString("u_pw").equals(u_pw)) {
				System.out.println("로그인 성공");
				rt = "로그인 성공";
			} else {
				System.out.println("비번 불일치");
				rt = "비번 불일치";
			}
		} else {
			System.out.println("아이디 불일치");
			rt = "아이디 불일치";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return rt;
	}
	
	
	//06검색 메서드 선언
	public ArrayList<User> uSearch(String sk, String sv) throws SQLException, ClassNotFoundException {
		
			System.out.println("06 검색메서드 선언 uSearch Mdao.java");
			System.out.println(alm + " <- alm 01 uSearch Mdao.java");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			alm = new ArrayList<User>();
			System.out.println(conn + "<-- conn");
			if(sk == null & sv == null){
				System.out.println("01 sk sv 둘다 null 조건");
				pstmt = conn.prepareStatement("select * from tb_user");
			}else if(sk != null & sv.equals("")){
				System.out.println("02 sk null 아니고 sv 공백 조건");
				pstmt = conn.prepareStatement("select * from tb_user");
			}else if(sk != null & sv != null){
				System.out.println("03 sk sv 둘다 null 아닌 조건");
				pstmt = conn.prepareStatement("select * from tb_user where "+ sk + "=?");	
				pstmt.setString(1, sv);
				
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setU_id(rs.getString(1));
				u.setU_pw(rs.getString(2));
				u.setU_level(rs.getString(3));
				u.setU_name(rs.getString(4));
				u.setU_email(rs.getString(5));
				u.setU_phone(rs.getString(6));
				u.setU_addr(rs.getString(7));
				alm.add(u);
					
			}
			rs.close();
			pstmt.close(); 
			conn.close();
			return alm;
	}
	
	//05 전체회원 조회 메서드 선언
	public ArrayList<User> uAllSelect() throws ClassNotFoundException, SQLException {
		System.out.println("05 전체회원 조회 메서드 선언 uAllSelect Mdao.java");
		System.out.println(alm + " <- alm 01 uAllSelect Mdao.java");
		alm = new ArrayList<User>();
		System.out.println(alm + " <- alm 02 uAllSelect Mdao.java");
		
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");
		pstmt = conn.prepareStatement("SELECT * FROM tb_user");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			u = new User();
			u.setU_id(rs.getString(1));
			u.setU_pw(rs.getString(2));
			u.setU_level(rs.getString(3));
			u.setU_name(rs.getString(4));
			u.setU_email(rs.getString(5));
			u.setU_phone(rs.getString(6));
			u.setU_addr(rs.getString(7));
			alm.add(u);
			System.out.println(alm + "alm 02 uAllSelect Mdao.java");	
		}
		rs.close();
		pstmt.close(); 
		conn.close();
		return alm;
	}
	
	//04한명회원 조회 메서드선언(수정화면)
	public User uSelectforUpdate(String uid) throws ClassNotFoundException, SQLException {
		System.out.println("04한명회원 조회 메서드선언(수정화면) uSelectforUpdate Mdao.java");
		//1~2단계 : 드라이버로딩 및 DB연결
		//3단계 : select 쿼리 준비
		//4단계 : select 쿼리 실행 후 ResultSet 객체에 담는다
		//5단계 : 쿼리 실행결과 활용(User 객체내에 셋팅)
		//6,7단계 : close (객체종료)
		//8단계 : return
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");
		pstmt = conn.prepareStatement(
				"SELECT * FROM tb_user WHERE u_id=?");
		pstmt.setString(1, uid);
		ResultSet rs = pstmt.executeQuery();
		
		
		User u = new User();
		if(rs.next()) {
			u.setU_id(rs.getString(1));
			u.setU_pw(rs.getString(2));
			u.setU_level(rs.getString(3));
			u.setU_name(rs.getString(4));
			u.setU_email(rs.getString(5));
			u.setU_phone(rs.getString(6));
			u.setU_addr(rs.getString(7));
		}
		
		pstmt.close(); 
		conn.close();
		return u;
	}
	
	//03 삭제처리 메서드 선언
	public void uDelete(String uid) throws ClassNotFoundException, SQLException {
		System.out.println("03 삭제처리 메서드 선언 uDelete Mdao.java");
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");
		
		pstmt = conn.prepareStatement("DELETE FROM tb_user WHERE u_id=?");
		pstmt.setString(1, uid);
		pstmt.executeUpdate();
		pstmt.close(); 
		conn.close();
	}
	
	//02 수정처리 메서드 선언
	public void uUpdate(User u) throws ClassNotFoundException, SQLException {
		System.out.println("02 수정처리 메서드 선언 uUpdate Mdao.java");
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");
		pstmt = conn.prepareStatement(
				"UPDATE tb_user SET u_pw=?,u_level=?,u_name=?,u_email=?,u_phone=?,u_addr=?	WHERE u_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, u.getU_pw());
		pstmt.setString(2, u.getU_level());
		pstmt.setString(3, u.getU_name());
		pstmt.setString(4, u.getU_email());
		pstmt.setString(5, u.getU_phone());
		pstmt.setString(6, u.getU_addr());
		pstmt.setString(7, u.getU_id());
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
	
	//01_02 입력처리 메서드 선언(매개변수 갯수 1개)
	public void uInsert(User u) throws SQLException, ClassNotFoundException{
	//1,2단계 드라이버로딩과 DB연결 부터 시작
		System.out.println("01_02  입력처리(매개변수 갯수 1개) uInsert Mdao.java");
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, u.getU_id());
		pstmt.setString(2, u.getU_pw());
		pstmt.setString(3, u.getU_level());
		pstmt.setString(4, u.getU_name());
		pstmt.setString(5, u.getU_email());
		pstmt.setString(6, u.getU_phone());
		pstmt.setString(7, u.getU_addr());
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}

	
	//01_01 입력처리 메서드 선언(매개변수 갯수 2개)
	public void uInsert(User u,Connection conn) throws SQLException{
		System.out.println("01_01  입력처리(매개변수 갯수 2개) uInsert Mdao.java");
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, u.getU_id());
		pstmt.setString(2, u.getU_pw());
		pstmt.setString(3, u.getU_level());
		pstmt.setString(4, u.getU_name());
		pstmt.setString(5, u.getU_email());
		pstmt.setString(6, u.getU_phone());
		pstmt.setString(7, u.getU_addr());
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
	

}





