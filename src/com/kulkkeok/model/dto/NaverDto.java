package com.kulkkeok.model.dto;

public class NaverDto {
	
	private String nid;
	private String nemail;
	private String nname;
	
	public NaverDto() {}

	public NaverDto(String nid, String nemail, String nname) {
		super();
		this.nid = nid;
		this.nemail = nemail;
		this.nname = nname;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getNemail() {
		return nemail;
	}

	public void setNemail(String nemail) {
		this.nemail = nemail;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}
	
	

}
