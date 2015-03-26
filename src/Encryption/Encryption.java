package Encryption;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {

	public String encryptionPwd(String data, String algorithm) {
		byte resultData[] = null;
		MessageDigest m = null;
		try {
			//创建  MessageDigest 对象, 调用 MessageDigest 类中的 getInstance
			//静态 factory 方法,算法名不区分大小写
			m = MessageDigest.getInstance(algorithm);
			//向MessageDigest传送要计算的数据,update传入的参数是字节类型或字节类型数组，
			//对于字符串，需要先使用getBytes( )方法生成字符串数组。
			m.update(data.getBytes("UTF8"));
			//计算摘要,生成散列码
			resultData = m.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return convertToHexString(resultData);
	}

	//将计算结果(byte数组)转换为字符串
	static String convertToHexString(byte data[]) {
		StringBuffer strBuffer = new StringBuffer();
		for (int i = 0; i < data.length; i++) {
			strBuffer.append(Integer.toHexString(0xff & data[i]));
		}
		return strBuffer.toString();
	}
}
