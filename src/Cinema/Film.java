package Cinema;

public class Film {
	private int idFilm; // 영화 번호
	private String title; // 영화 제목
	private String imageUrl; // 영화 포스터 URL
	private int agePhase; // 관람가
	private int seatNum; // 좌석 수
	private String date; // 상영기간
	
	public void Film() {};
	
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getAgePhase() {
		return agePhase;
	}

	public void setAgePhase(int agePhase) {
		this.agePhase = agePhase;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}