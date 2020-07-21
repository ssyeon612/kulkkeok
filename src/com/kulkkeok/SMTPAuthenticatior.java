package com.kulkkeok;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{
	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("kulkkeok@gmail.com", "kkkk0101");
	}

}
