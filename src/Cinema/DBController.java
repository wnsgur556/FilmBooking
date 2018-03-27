package Cinema;

import java.sql.*;
import java.util.*;
import java.text.*;

public class DBController {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/film_booking?autoReconnect=true&useSSL=false";
	
	/* 데이터베이스 연결 */
	void connect() {
			try {
				Class.forName(jdbc_driver);
				
				conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	/* 데이터베이스 연결 해지 */
	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/* 영화 리스트 */
	public ArrayList<Film> getFilmList() {
		connect();
		ArrayList<Film> datas = new ArrayList<Film>();
		
		String sql = "select * from film_info order by id_film";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Film film = new Film();
				film.setIdFilm(rs.getInt("id_film"));
				film.setTitle(rs.getString("name_film"));
				film.setImageUrl(rs.getString("image_film"));
				film.setAgePhase(rs.getInt("age_phase"));
				film.setSeatNum(rs.getInt("seat_num"));
				film.setDate(rs.getString("date"));
				datas.add(film);
			}
			rs.close();
		}	catch (SQLException e) {
				e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	/* 영화 추가 */
	public void insertFilm(Film insFilm) {
		connect();
		String firstSQL = "insert into film_info(name_film, image_film, age_phase, seat_num, Date) values (?, ?, ?, ?, ?)"; // 영화 추가
		String secondSQL = "insert into film_seat_info(id_film, s1, s2, s3, s4, s5, s6, s7, s8, s9) values (?, 0, 0, 0, 0, 0, 0, 0, 0, 0)"; // 해당 영화와 관련된 좌석 정보 추가
		
		try {
			pstmt = conn.prepareStatement(firstSQL);
			pstmt.setString(1, insFilm.getTitle());
			pstmt.setString(2, insFilm.getImageUrl());
			pstmt.setInt(3, insFilm.getAgePhase());
			pstmt.setInt(4, insFilm.getSeatNum());
			pstmt.setString(5, insFilm.getDate());
			pstmt.executeUpdate();
			
			String tmpSQL = "select id_film from film_info order by id_film desc limit 1"; // 최근 등록한 영화 정보
			pstmt = conn.prepareStatement(tmpSQL);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int id_film = rs.getInt("id_film");
			rs.close();
			
			pstmt = conn.prepareStatement(secondSQL);
			pstmt.setInt(1, id_film);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	/* 영화 삭제 */
	public void deleteFilm(Film delFilm) {
		connect();
		String firstSQL = "delete from film_info where id_film=?"; // 영화 삭제
		String secondSQL = "delete from film_resv_info where id_film=?"; // 해당 영화와 관련된 예약 정보 삭제
		String lastSQL = "delete from film_seat_info where id_film=?"; // 해당 영화의 관련된 좌석 정보 삭제
		
		try {
			pstmt = conn.prepareStatement(firstSQL);
			pstmt.setInt(1, delFilm.getIdFilm());
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(secondSQL);
			pstmt.setInt(1, delFilm.getIdFilm());
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(lastSQL);
			pstmt.setInt(1, delFilm.getIdFilm());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	/* 특정 영화 정보 조회 */
	public Film getFilm(int idFilm) {
		connect();
		Film film = new Film();
		String sql = "select * from film_info where id_film=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idFilm);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			film.setIdFilm(rs.getInt("id_film"));
			film.setTitle(rs.getString("name_film"));
			film.setImageUrl(rs.getString("image_film"));
			film.setAgePhase(rs.getInt("age_phase"));
			film.setSeatNum(rs.getInt("seat_num"));
			film.setDate(rs.getString("date"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return film;
	}
	
	/* 영화 좌석 업데이트 */
	public void updateSeatNum(int idFilm, int seatNum, int set) {
		String sql = "update film_seat_info set s" + seatNum + "=? where id_film=" + idFilm; // 해당 영화의 특정 좌석 정보 업데이트
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* 해당 좌석 0으로 Setting */
			if (set == 0) {
				pstmt.setInt(1, 0);
				pstmt.executeUpdate();
			}
			/* 해당 좌석 1으로 Setting */
			else if (set == 1) {
				pstmt.setInt(1, 1);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/* 영화 좌석 정보 */
	public FilmSeatStatus getSeatInfo(int idFilm) {
		connect();
		FilmSeatStatus seatInfo = new FilmSeatStatus();
		String sql = "select * from film_seat_info where id_film=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idFilm);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			seatInfo.setIdSeat(rs.getInt("id_seat"));
			seatInfo.setIdFilm(idFilm);
			seatInfo.setS1(rs.getInt("s1"));
			seatInfo.setS2(rs.getInt("s2"));
			seatInfo.setS3(rs.getInt("s3"));
			seatInfo.setS4(rs.getInt("s4"));
			seatInfo.setS5(rs.getInt("s5"));
			seatInfo.setS6(rs.getInt("s6"));
			seatInfo.setS7(rs.getInt("s7"));
			seatInfo.setS8(rs.getInt("s8"));
			seatInfo.setS9(rs.getInt("s9"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return seatInfo;
	}
	
	/* 회원 리스트 */
	public ArrayList<Member> getMemList() {
		connect();
		ArrayList<Member> datas = new ArrayList<Member>();
		
		String sql = "select * from mem_info order by id_mem";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Member mem = new Member();
				mem.setIdMem(rs.getInt("id_mem"));
				mem.setPassword(rs.getString("password"));
				mem.setID(rs.getString("name_mem"));
				mem.setAge(rs.getInt("age_mem"));
				mem.setRegisterDate(rs.getString("register_date"));
				datas.add(mem);
			}
			rs.close();
		}	catch (SQLException e) {
				e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	/* 회원 가입 ID 중복 검사 */
	public boolean idCheck(String id) {
		connect();
		String sql = "select * from mem_info order by id_mem";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				/* ID 중복 */
				if(rs.getString("name_mem").equals(id)) {
					rs.close();
					return true;
				}
			}
			rs.close();
		}	catch (SQLException e) {
				e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return false;
	}
	
	/* 로그인 검사 */
	public boolean memCheck(String id, String pw) {
		connect();
		String sql = "select * from mem_info order by id_mem";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				/* 로그인 성공 */
				if(rs.getString("name_mem").equals(id) && rs.getString("password").equals(pw)) {
					rs.close();
					return true;
				}
			}
			rs.close();
		}	catch (SQLException e) {
				e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return false;
	}
	
	/* 회원 등록 */
	public void joinMember(Member joinMember) {
		connect();
		String sql = "insert into mem_info(password, name_mem, age_mem, register_date) values (?, ?, ?, ?)"; // 회원 추가
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, joinMember.getPassword());
			pstmt.setString(2, joinMember.getID());
			pstmt.setInt(3, joinMember.getAge());
			pstmt.setString(4, joinMember.getRegisterDate());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	/* 회원 삭제 */
	public void deleteMember(Member delMember) {
		connect();
		String firstSQL = "delete from mem_info where id_mem=?"; // 회원 삭제
		
		try {
			int id_mem = delMember.getIdMem();
			pstmt = conn.prepareStatement(firstSQL);
			pstmt.setInt(1, delMember.getIdMem());
			pstmt.executeUpdate();
			
			String secondSQL = "select * from film_resv_info where id_mem=?"; // 해당 회원이 예약한 영화 내역
			pstmt = conn.prepareStatement(secondSQL);
			pstmt.setInt(1, id_mem);
			ResultSet firstRs = pstmt.executeQuery();
			/* 해당 회원이 예약한 영화 내역 삭제 및 해당 영화 좌석 업데이트 */
			while (firstRs.next()) {
				FilmResv filmResv = new FilmResv();
				filmResv.setIdResv(firstRs.getInt("id_resv"));
				filmResv.setIdMem(id_mem);
				filmResv.setIdFilm(firstRs.getInt("id_film"));
				filmResv.setTitle(firstRs.getString("film_name"));
				filmResv.setDate(firstRs.getString("Date"));
				filmResv.setResvDate(firstRs.getString("resv_date"));
				filmResv.setSeatNum(firstRs.getInt("seat_no"));
				filmResv.setStatus(firstRs.getString("status"));
				/* 영화 좌석 정보 업데이트 (삭제될 회원이 예약한 자리 업데이트) */
				updateSeatNum(filmResv.getIdFilm(), filmResv.getSeatNum(), 0);
			}
			firstRs.close();
			String thirdSQL = "delete from film_resv_info where id_mem=?"; // 해당 회원이 예약한 영화 내역 삭제
			pstmt = conn.prepareStatement(thirdSQL);
			pstmt.setInt(1, id_mem);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	/* 회원 정보 수정 */
	public void updateMember(int idMem, String pw, int age) {
		connect();
		String sql = "update mem_info set password=?, age_mem=? where id_mem=" + idMem; // 회원 정보 수정
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setInt(2, age);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
	}
	
	/* 특정 회원 정보 조회 */
	public Member getMember(String ID) {
		connect();
		Member mem = new Member();
		String sql = "select * from mem_info where name_mem=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			mem.setIdMem(rs.getInt("id_mem"));
			mem.setPassword(rs.getString("password"));
			mem.setID(rs.getString("name_mem"));
			mem.setAge(rs.getInt("age_mem"));
			mem.setRegisterDate(rs.getString("register_date"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return mem;
	}
	
	/* 특정 회원 영화 예매 내역 추가 */
	public void resvFilm(int idMem, int idFilm, int seatNum) {
		Film film = getFilm(idFilm); // 영화 정보 획득
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		java.util.Date current = new java.util.Date();
		String today = s.format(current); // 오늘 날짜 획득
		connect();
		String sql = "insert into film_resv_info(id_mem, id_film, film_name, Date, resv_date, seat_no, status) values (?, ?, ?, ?, ?, ?, ?)"; // 영화 예매 목록 추가
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idMem);
			pstmt.setInt(2, idFilm);
			pstmt.setString(3, film.getTitle());
			pstmt.setString(4, film.getDate());
			pstmt.setString(5, today);
			pstmt.setInt(6, seatNum);
			pstmt.setString(7, "-");
			pstmt.executeUpdate();
			/* 해당 영화에 대한 해당 좌석 업데이트 */
			updateSeatNum(idFilm, seatNum, 1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	/* 특정 회원 예매 내역 리스트 */
	public ArrayList<FilmResv> getResvFilmList(int idMem) {
		connect();
		ArrayList<FilmResv> datas = new ArrayList<FilmResv>();
		
		String sql = "select * from film_resv_info where id_mem=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idMem);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				FilmResv film = new FilmResv();
				film.setIdResv(rs.getInt("id_resv"));
				film.setIdMem(idMem);
				film.setIdFilm(rs.getInt("id_film"));
				film.setTitle(rs.getString("film_name"));
				film.setDate(rs.getString("Date"));
				film.setResvDate(rs.getString("resv_date"));
				film.setSeatNum(rs.getInt("seat_no"));
				film.setStatus(rs.getString("status"));
				datas.add(film);
			}
			rs.close();
		}	catch (SQLException e) {
				e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	/* 특정 회원 결제 내역 업데이트 */
	public void paymentFilm(int idResv) {
		connect();
		String sql = "update film_resv_info set status=? where id_resv=" + idResv; // 회원 결제 내역 업데이트
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "결제");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	/* 특정 회원 예매 취소 */
	public void cancelResvFilm(int idResv, int idFilm, int seatNum) {
		connect();
		String firstSQL = "delete from film_resv_info where id_resv=?"; // 영화 예매 내역 삭제
		
		try {
			pstmt = conn.prepareStatement(firstSQL);
			pstmt.setInt(1, idResv);
			pstmt.executeUpdate();
			
			/* 영화 좌석 정보 업데이트 */
			updateSeatNum(idFilm, seatNum, 0);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
}