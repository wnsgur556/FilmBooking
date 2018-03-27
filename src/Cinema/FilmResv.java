package Cinema;

public class FilmResv {
	private int idResv; // 예약 번호
	private int idMem; // 회원 번호
	private int idFilm; // 영화 아이디
	private String title; // 영화 제목
	private String Date; // 상영기간
	private String resvDate; // 예약 일자
	private int seatNum; // 좌석 번호
	private String status; // 결제 상태
	
	public void FilmResv() {}
	
	public int getIdResv() {
		return idResv;
	}

	public void setIdResv(int idResv) {
		this.idResv = idResv;
	}

	public int getIdMem() {
		return idMem;
	}

	public void setIdMem(int idMem) {
		this.idMem = idMem;
	}

	public int getIdFilm() {
		return idFilm;
	}

	public void setIdFilm(int idFilm) {
		this.idFilm = idFilm;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}
	
	public String getResvDate() {
		return resvDate;
	}

	public void setResvDate(String resvDate) {
		this.resvDate = resvDate;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	};
	
	
}