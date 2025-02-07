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
	private String xLocation;
	private String yLocaton;
	private int targetTime;
	
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getNick() {
		return nick;
	}
	public String getEmail() {
		return email;
	}
	public String getGender() {
		return gender;
	}
	public String getHobby() {
		return hobby;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public String getLastPw() {
		return lastPw;
	}
	public String getUserType() {
		return userType;
	}
	public String getxLocation() {
		return xLocation;
	}
	public String getyLocaton() {
		return yLocaton;
	}
	public int getTargetTime() {
		return targetTime;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public void setLastPw(String lastPw) {
		this.lastPw = lastPw;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public void setxLocation(String xLocation) {
		this.xLocation = xLocation;
	}
	public void setyLocaton(String yLocaton) {
		this.yLocaton = yLocaton;
	}
	public void setTargetTime(int targetTime) {
		this.targetTime = targetTime;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", email=" + email
				+ ", gender=" + gender + ", hobby=" + hobby + ", createDate=" + createDate + ", updateDate="
				+ updateDate + ", deleteDate=" + deleteDate + ", lastPw=" + lastPw + ", userType=" + userType
				+ ", xLocation=" + xLocation + ", yLocaton=" + yLocaton + ", targetTime=" + targetTime + "]";
	}
	
}
