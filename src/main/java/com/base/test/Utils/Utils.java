package com.base.test.Utils;

public class Utils {
	public static boolean checkSession(String sessionID){
		if(sessionID == null || sessionID.equals(""))
			return false;
		else
			return true;
	}
}
