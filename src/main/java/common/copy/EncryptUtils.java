package common.copy;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	
	// 암호화 기능 메소드
	public static String md5(String message) {
		
		String resultData = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			// 대상 문자열 byte 화
			byte[] bytes = message.getBytes();
			
			md.update(bytes);
			
			// 암호화된 결과 얻기
			byte[] digest = md.digest();
			
			// 암호화된 결과를 16진수로 문자열로 변환
			for (int i = 0; i < digest.length; i++) {
				resultData += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return resultData;
	}
	
}
