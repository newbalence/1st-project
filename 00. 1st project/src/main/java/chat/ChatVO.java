package chat;

public class ChatVO {
	private String chatnum;
	private String chatroomno;
	private String sender;
	private String chatcontent;
	private String chattime;
	
	public String getChatnum() {
		return chatnum;
	}
	public String getChatroomno() {
		return chatroomno;
	}
	public String getSender() {
		return sender;
	}
	public String getChatcontent() {
		return chatcontent;
	}
	public String getChattime() {
		return chattime;
	}
	public void setChatnum(String chatnum) {
		this.chatnum = chatnum;
	}
	public void setChatroomno(String chatroomno) {
		this.chatroomno = chatroomno;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}
	public void setChattime(String chattime) {
		this.chattime = chattime;
	}
	
	@Override
	public String toString() {
		return "ChatVO [chatnum=" + chatnum + ", chatroomno=" + chatroomno + ", sender=" + sender + ", chatcontent="
				+ chatcontent + ", chattime=" + chattime + "]";
	}
	
}
