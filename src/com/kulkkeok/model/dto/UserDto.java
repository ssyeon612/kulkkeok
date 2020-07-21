package com.kulkkeok.model.dto;

public class UserDto {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String gradeCode;
	private byte[] userPicture;
	  
	public UserDto(){}
	public UserDto(String userId, String userPw, String userName, String userEmail, String userPhone, String gradeCode, byte[] userPicture) {
	    super();
	    this.userId = userId;
	    this.userPw = userPw;
	    this.userName = userName;
	    this.userEmail = userEmail;
	    this.userPhone = userPhone;
	    this.gradeCode = gradeCode;
	    this.userPicture = userPicture;
	}
	public UserDto(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}
	public String getUserId() {
	    return userId;
	}
	public void setUserId(String userId) {
	    this.userId = userId;
	}
	public String getUserPw() {
	    return userPw;
	}
	public void setUserPw(String userPw) {
	    this.userPw = userPw;
	}
	public String getUserName() {
	    return userName;
	}
	public void setUserName(String userName) {
	    this.userName = userName;
	}
	public String getUserEmail() {
	    return userEmail;
	}
	public void setUserEmail(String userEmail) {
	    this.userEmail = userEmail;
	}
	public String getUserPhone() {
	    return userPhone;
	}
	public void setUserPhone(String userPhone) {
	    this.userPhone = userPhone;
	}
	public String getGradeCode() {
	    return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
	    this.gradeCode = gradeCode;
	}
	public byte[] getUserPicture() {
	    return userPicture;
	}
	public void setUserPicture(byte[] bs) {
	    this.userPicture = bs;
	}
}