package board;

public class BoardVO {
	private String bno;
	private String author;
	private String nick;
	private String title;
	private String content;
	private String createDate;
	private String updateDate;
	private String boardType;
	private String originName;
	private String uploadname;
	private String location;
	private long fileSize;
	private String userType;
	private int hit;
	private int push;
	private int userPush;
	private String listType;
	private String reply; 
	
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public int getUserPush() {
		return userPush;
	}
	public void setUserPush(int userPush) {
		this.userPush = userPush;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getBno() {
		return bno;
	}
	public String getAuthor() {
		return author;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public String getBoardType() {
		return boardType;
	}
	public String getOriginName() {
		return originName;
	}
	public String getUploadname() {
		return uploadname;
	}
	public String getLocation() {
		return location;
	}
	public long getFileSize() {
		return fileSize;
	}
	public String getUserType() {
		return userType;
	}
	public int getHit() {
		return hit;
	}
	public int getPush() {
		return push;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public void setUploadname(String uploadname) {
		this.uploadname = uploadname;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public void setPush(int push) {
		this.push = push;
	}
	
	
		
}
