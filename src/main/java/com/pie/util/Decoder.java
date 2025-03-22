package com.pie.util;

import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.KeySpec;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

import org.apache.commons.codec.binary.Base64;

public class Decoder {

	public static String decodeInput(String input) {
		final byte[] SALT = { (byte) 0x21, (byte) 0x21, (byte) 0xF0, (byte) 0x55, (byte) 0xC3, (byte) 0x9F, (byte) 0x5A, (byte) 0x75 };
		final int ITERATION_COUNT = 31;
		byte[] dec = Base64.decodeBase64(input.getBytes());
		KeySpec keySpec = new PBEKeySpec(null, SALT, ITERATION_COUNT);
		AlgorithmParameterSpec paramSpec = new PBEParameterSpec(SALT, ITERATION_COUNT);
		String result = null;
		try {
			SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);
			Cipher dcipher = Cipher.getInstance(key.getAlgorithm());
			dcipher.init(Cipher.DECRYPT_MODE, key, paramSpec);
			byte[] decoded = dcipher.doFinal(dec);
			result = new String(decoded);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
