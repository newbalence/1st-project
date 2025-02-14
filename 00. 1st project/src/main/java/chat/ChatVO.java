package chat;

public class ChatVO {
	private String chatno;
	private String chatroomno;
	private String sender;
	private String chatcontent;
	private String chattime;
	private String id;
	
	public String getChatno() {
		return chatno;
	}
	public void setChatno(String chatno) {
		this.chatno = chatno;
	}
	public String getChatroomno() {
		return chatroomno;
	}
	public void setChatroomno(String chatroomno) {
		this.chatroomno = chatroomno;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getChatcontent() {
		return chatcontent;
	}
	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}
	public String getChattime() {
		return chattime;
	}
	public void setChattime(String chattime) {
		this.chattime = chattime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

	@Override
	public String toString() {
		return "ChatVO [chatno=" + chatno + ", chatroomno=" + chatroomno + ", sender=" + sender + ", chatcontent="
				+ chatcontent + ", chattime=" + chattime + ", id=" + id + "]";
	}
	
}
