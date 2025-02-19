package user;

public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String nick;
	private String email;
	private String gender;
	private String hobby;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private String lastPw;
	private String userType;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public String getLastPw() {
		return lastPw;
	}
	public void setLastPw(String lastPw) {
		this.lastPw = lastPw;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", email=" + email
				+ ", gender=" + gender + ", hobby=" + hobby + ", createDate=" + createDate + ", updateDate="
				+ updateDate + ", deleteDate=" + deleteDate + ", lastPw=" + lastPw + ", userType=" + userType + "]";
	}
	
	
	
	
}
