package com.kulkkeok.model.dto;

public class KakaoDto {
	
	private String kid;
	private String kname;
	private String kemail;
	
	public KakaoDto() {}

	public KakaoDto(String kid, String kname, String kemail) {
		super();
		this.kid = kid;
		this.kname = kname;
		this.kemail = kemail;
	}

	public String getKid() {
		return kid;
	}

	public void setKid(String kid) {
		this.kid = kid;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getKemail() {
		return kemail;
	}

	public void setKemail(String kemail) {
		this.kemail = kemail;
	}
	
	
	

}
