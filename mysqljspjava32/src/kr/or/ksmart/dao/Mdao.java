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
	
	
	
	//08 ���ǿ� �����ϱ� ���� �޼��� ����(���̵�,�̸�,����)
	public User uGetForSession(String u_id) throws SQLException, ClassNotFoundException {
		System.out.println("08 ���ǿ� �����ϱ� ���� �޼��� ���� uGetForSession Mdao.java");
        System.out.println("uGetForSession ȣ�� �Ϸ�");
        
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
        




	
	// 07 �α��� üũ �޼��� ����
	public String uLoginCheck(String u_id, String u_pw) throws ClassNotFoundException, SQLException {
		System.out.println("07 �α��� üũ �޼��� ���� uLoginCheck Mdao.java");

		DriverDB db = new DriverDB();
		conn = db.driverDbcon();

		pstmt = conn.prepareStatement("select u_pw from tb_user where u_id=?");
		pstmt.setString(1, u_id);
		rs = pstmt.executeQuery();

		String rt = null;

		if (rs.next()) {
			if (rs.getString("u_pw").equals(u_pw)) {
				System.out.println("�α��� ����");
				rt = "�α��� ����";
			} else {
				System.out.println("��� ����ġ");
				rt = "��� ����ġ";
			}
		} else {
			System.out.println("���̵� ����ġ");
			rt = "���̵� ����ġ";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return rt;
	}
	
	
	//06�˻� �޼��� ����
	public ArrayList<User> uSearch(String sk, String sv) throws SQLException, ClassNotFoundException {
		
			System.out.println("06 �˻��޼��� ���� uSearch Mdao.java");
			System.out.println(alm + " <- alm 01 uSearch Mdao.java");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			alm = new ArrayList<User>();
			System.out.println(conn + "<-- conn");
			if(sk == null & sv == null){
				System.out.println("01 sk sv �Ѵ� null ����");
				pstmt = conn.prepareStatement("select * from tb_user");
			}else if(sk != null & sv.equals("")){
				System.out.println("02 sk null �ƴϰ� sv ���� ����");
				pstmt = conn.prepareStatement("select * from tb_user");
			}else if(sk != null & sv != null){
				System.out.println("03 sk sv �Ѵ� null �ƴ� ����");
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
	
	//05 ��üȸ�� ��ȸ �޼��� ����
	public ArrayList<User> uAllSelect() throws ClassNotFoundException, SQLException {
		System.out.println("05 ��üȸ�� ��ȸ �޼��� ���� uAllSelect Mdao.java");
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
	
	//04�Ѹ�ȸ�� ��ȸ �޼��弱��(����ȭ��)
	public User uSelectforUpdate(String uid) throws ClassNotFoundException, SQLException {
		System.out.println("04�Ѹ�ȸ�� ��ȸ �޼��弱��(����ȭ��) uSelectforUpdate Mdao.java");
		//1~2�ܰ� : ����̹��ε� �� DB����
		//3�ܰ� : select ���� �غ�
		//4�ܰ� : select ���� ���� �� ResultSet ��ü�� ��´�
		//5�ܰ� : ���� ������ Ȱ��(User ��ü���� ����)
		//6,7�ܰ� : close (��ü����)
		//8�ܰ� : return
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
	
	//03 ����ó�� �޼��� ����
	public void uDelete(String uid) throws ClassNotFoundException, SQLException {
		System.out.println("03 ����ó�� �޼��� ���� uDelete Mdao.java");
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");
		
		pstmt = conn.prepareStatement("DELETE FROM tb_user WHERE u_id=?");
		pstmt.setString(1, uid);
		pstmt.executeUpdate();
		pstmt.close(); 
		conn.close();
	}
	
	//02 ����ó�� �޼��� ����
	public void uUpdate(User u) throws ClassNotFoundException, SQLException {
		System.out.println("02 ����ó�� �޼��� ���� uUpdate Mdao.java");
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
	
	//01_02 �Է�ó�� �޼��� ����(�Ű����� ���� 1��)
	public void uInsert(User u) throws SQLException, ClassNotFoundException{
	//1,2�ܰ� ����̹��ε��� DB���� ���� ����
		System.out.println("01_02  �Է�ó��(�Ű����� ���� 1��) uInsert Mdao.java");
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

	
	//01_01 �Է�ó�� �޼��� ����(�Ű����� ���� 2��)
	public void uInsert(User u,Connection conn) throws SQLException{
		System.out.println("01_01  �Է�ó��(�Ű����� ���� 2��) uInsert Mdao.java");
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





