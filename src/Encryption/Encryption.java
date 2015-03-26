package Encryption;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {

	public String encryptionPwd(String data, String algorithm) {
		byte resultData[] = null;
		MessageDigest m = null;
		try {
			//����  MessageDigest ����, ���� MessageDigest ���е� getInstance
			//��̬ factory ����,�㷨�������ִ�Сд
			m = MessageDigest.getInstance(algorithm);
			//��MessageDigest����Ҫ���������,update����Ĳ������ֽ����ͻ��ֽ��������飬
			//�����ַ�������Ҫ��ʹ��getBytes( )���������ַ������顣
			m.update(data.getBytes("UTF8"));
			//����ժҪ,����ɢ����
			resultData = m.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return convertToHexString(resultData);
	}

	//��������(byte����)ת��Ϊ�ַ���
	static String convertToHexString(byte data[]) {
		StringBuffer strBuffer = new StringBuffer();
		for (int i = 0; i < data.length; i++) {
			strBuffer.append(Integer.toHexString(0xff & data[i]));
		}
		return strBuffer.toString();
	}
}
