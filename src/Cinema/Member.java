package Cinema;

public class Member {
	private int idMem; // 회원 번호
	private String password; // 비밀번호
	private String ID; // 아이디
	private int age; // 나이
	private String registerDate; // 등록 일자
	
	public void Member() {}

	public int getIdMem() {
		return idMem;
	}

	public void setIdMem(int idMem) {
		this.idMem = idMem;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	};
	
	
}