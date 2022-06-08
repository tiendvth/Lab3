package com.example.com.example.lab03.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class SHA512Hasher {
    // hàm băm mật khẩu, tham số là mật khẩu nguyên bản và muối.
    public static String encode(String passwordToHash, String saltString) {
        byte[] salt = saltString.getBytes();
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] bytes = md.digest(passwordToHash.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    public static boolean checkPassword(String passwordHash, String originalPassword) {
        String[] passwordHashSplit = passwordHash.split("\\.");
        String salt = null;
        System.out.println(passwordHashSplit.length);
        if (passwordHashSplit.length == 2) {
            salt = passwordHashSplit[1];
            passwordHash = passwordHashSplit[0];
        }
        System.out.println("Salt: " + salt);
        String generatedHash = encode(originalPassword, salt);
        System.out.println(passwordHash.equals(generatedHash));
        return passwordHash.equals(generatedHash);
    }

    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom rnd = new SecureRandom();

    public static String randomString(int len) {
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++)
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(randomString(7));
    }
}