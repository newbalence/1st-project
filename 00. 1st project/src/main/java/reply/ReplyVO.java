package reply;

public class ReplyVO {
	private String rno;
	private String rauthor;
	private String bno;
	private String rcontent;
	private String createDate;
	private String updateDate;
	private String userType;
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getRno() {
		return rno;
	}
	public String getRauthor() {
		return rauthor;
	}
	public String getBno() {
		return bno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public void setRauthor(String rauthor) {
		this.rauthor = rauthor;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
}
