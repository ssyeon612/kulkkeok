package chat;

public class ChatDto {
	private int chatNo;
	private String chatName;
	private String chatContent;
	private String chatTime;
	
	public ChatDto() {}
	public ChatDto(int chatNo, String chatName, String chatContent, String chatTime) {
		this.chatNo = chatNo;
		this.chatName = chatName;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	
}