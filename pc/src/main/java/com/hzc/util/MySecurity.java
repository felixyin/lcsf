package com.hzc.util;

// import org.apache.log4j.Logger;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;

public class MySecurity {

    private static int chrsz = 8; /*
                                   * bits per input character. 8 - ASCII; 16 -
                                   * Unicode
                                   */

    private static int[] decode;

    private static int[] Polynomials31 = { 0x40c6e78f, 0x44ea7b19, 0x45da25ce, 0x470c368e, 0x4920f4c1, 0x4a2fb865, 0x4b641875, 0x4d474412,
        0x4c175700, 0x4e880047, 0x50a5894c, 0x51ae3883, 0x531df126, 0x563e62e8, 0x586801c2, 0x5bef4706, 0x5c14c48a, 0x5d06e2a7, 0x5f2f8a72,
        0x623311d9, 0x65616f52, 0x668043b4, 0x672161c9, 0x67f0a6a8, 0x6814750f, 0x6c4920c3, 0x6dca541b, 0x6e97e1ed, 0x70963ac8, 0x72de5f24,
        0x7411688a, 0x7502196b, 0x76202331, 0x7887a9e1, 0x790621f4, 0x7e79deae, 0x7faca450 };

    private static int State31;
    private static int Polynom31;
    private static int State33;
    private static int Polynom33;
    private static int State64H, State64L, Polynom64, Butt;
    private static String b64_tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    static {
        decode = new int[1000];
        for (int i = 0; i < b64_tab.length(); i++) {
            decode[b64_tab.charAt(i)] = i;
        }
    }

    private static int pn() {
        do {
            int MSB = State31 & 0x80000000;
            State31 &= 0x7fffffff;

            if ((State31 & 1) != 0)
                State31 = (State31 >>> 1) ^ Polynom31;
            else
                State31 >>>= 1;

            if ((State33 & 0x80000000) != 0)
                State31 |= 0x80000000;

            if (MSB != 0)
                State33 = (State33 << 1) ^ Polynom33;
            else
                State33 <<= 1;

            MSB = (State64H & 1);
            State64H >>>= 1;
            State64H |= State64L & 0x80000000;

            if (MSB != 0)
                State64L = (State64L << 1) ^ Polynom64;
            else
                State64L <<= 1;
        } while ((State64L & Butt) != 0);

        return (State31 ^ State33);
    }

    private static void pnInit(String passphr) {
        int[] pnState = core_md5(str2binl(passphr), passphr.length() * chrsz);
        State31 = pnState[0];
        if ((State31 & 0x7fffffff) == 0)
            State31++;
        State33 = pnState[1];
        if (State33 == 0)
            State33++;
        State64H = pnState[2];
        State64L = pnState[3];
        if (State64H == 0 && State64L == 0)
            State64L++;

        int[] Polynom = core_md5(pnState, 0x80);
        int[] Polynom1 = core_md5(str2binl(passphr), passphr.length() * chrsz >> 1);
        // String pol="", pol1="", newpol="";
        for (int i = 0; i < Polynom.length; i++) {
            // pol=pol+" pol"+String.valueOf(i)+" "+String.valueOf(Polynom[i]);
            // pol1=pol1+" pol1"+String.valueOf(i)+" "+String.valueOf(Polynom1[i]);
            Polynom[i] ^= Polynom1[i];
            // newpol=newpol+" newpol"+String.valueOf(i)+" "+String.valueOf(Polynom[i]);
            Polynom[i] = 0; // Polynom1[i] & 1;
        }

        // System.out.println("pol "+pol+" pol1 "+pol1+" newpol "+newpol);
        Polynom31 = Polynomials31[(Polynom[0] >>> 1) % Polynomials31.length];
        Polynom33 = Polynom[1] | 1;
        Polynom64 = Polynom[2] | 1;
        Butt = 1 << (Polynom[3] & 0x1f);
        Butt |= 1 << ((Polynom[3] >> 8) & 0x1f);

        // System.out.println("State31 "+State31+" State33 "+State33+" State64H "+State64H+" State64L "+State64L+" Polynom31 "+Polynom31+" Polynom33 "+Polynom33+" Polynom64 "+Polynom64+" Butt "+Butt+" Polynom[3] "+Polynom[3]);
    }

    private static String expand7to8(int[] array) {// System.out.println("array "+array.length);
        String str = "";
        for (int i = 0; i < array.length; i += 7) {
            int tmp = array[i];
            int out = tmp >> 1;
            str += Character.toString((char) (out & 0x7f));
            for (int j = 1; j < 8; j++) {
                out = (tmp << (7 - j)) & 0x7f;
                if ((i + j) < array.length)
                    tmp = array[i + j];
                else
                    tmp = 0;
                str += Character.toString((char) (out |= (tmp & 0xff) >> (j + 1)));
            }
        }
        str = str.split("\0")[0];
        return str;
    }

    private static int[] crypt(int[] ina) {
        int[] ota = new int[ina.length];
        for (int i = 0; i < ina.length; i++) {
            ota[i] = ina[i] ^ pn();
        }
        return ota;
    }

    private static int[] b64_to_array(String str) {
        int lng = str.length();

        int[] arr = new int[lng];
        int index = 0;
        for (int i = 0; i < str.length(); i += 4) {
            char b1 = str.charAt(i);
            char b2 = (i + 1 < lng) ? str.charAt(i + 1) : 0;
            char b3 = (i + 2 < lng) ? str.charAt(i + 2) : 0;
            char b4 = (i + 3 < lng) ? str.charAt(i + 3) : 0;
            int triplet =
                ((decode[b1] << 18) & 0xffffff) | ((decode[b2] << 12) & 0x3ffff) | ((decode[b3] << 6) & 0xfff) | ((decode[b4]) & 0x3f);
            arr[index++] = (triplet >> 16) & 0xff;
            if (b3 != 0)
                arr[index++] = (triplet >> 8) & 0xff;
            if (b4 != 0)
                arr[index++] = triplet & 0xff;
        }
        int[] newarr = new int[index];
        for (int i = 0; i < index; i++) {
            newarr[i] = arr[i];
        }// System.out.println("arr length "+newarr.length);
        return newarr;
    }

    private static int safe_add(int x, int y) {
        int lsw = (x & 0xFFFF) + (y & 0xFFFF);
        int msw = (x >> 16) + (y >> 16) + (lsw >> 16);
        return (msw << 16) | (lsw & 0xFFFF);
    }

    private static int bit_rol(int num, int cnt) {
        return (num << cnt) | (num >>> (32 - cnt));
    }

    /*
     * These functions implement the four basic operations the algorithm uses.
     */
    private static int md5_cmn(int q, int a, int b, int x, int s, int t) {
        return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s), b);
    }

    private static int md5_ff(int a, int b, int c, int d, int x, int s, int t) {
        return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
    }

    private static int md5_gg(int a, int b, int c, int d, int x, int s, int t) {
        return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
    }

    private static int md5_hh(int a, int b, int c, int d, int x, int s, int t) {
        return md5_cmn(b ^ c ^ d, a, b, x, s, t);
    }

    private static int md5_ii(int a, int b, int c, int d, int x, int s, int t) {
        return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
    }

    /*
     * Calculate the MD5 of an array of little-endian words, and a bit length
     */
    private static int[] core_md5(int[] x1, int len) {
        int maxIndex = x1.length - 1;
        maxIndex = Math.max(maxIndex, 15);
        maxIndex = Math.max(maxIndex, len >> 5);
        maxIndex = Math.max(maxIndex, (((len + 64) >>> 9) << 4) + 14);
        int[] x = new int[maxIndex + 1];
        for (int i = 0; i < x1.length; i++) {
            x[i] = x1[i];
        }

        /* append padding */
        x[len >> 5] |= 0x80 << ((len) % 32);
        x[(((len + 64) >>> 9) << 4) + 14] = len;

        int a = 1732584193;
        int b = -271733879;
        int c = -1732584194;
        int d = 271733878;

        for (int i = 0; i < x.length; i += 16) {
            int olda = a;
            int oldb = b;
            int oldc = c;
            int oldd = d;

            a = md5_ff(a, b, c, d, x[i + 0], 7, -680876936);
            d = md5_ff(d, a, b, c, x[i + 1], 12, -389564586);
            c = md5_ff(c, d, a, b, x[i + 2], 17, 606105819);
            b = md5_ff(b, c, d, a, x[i + 3], 22, -1044525330);
            a = md5_ff(a, b, c, d, x[i + 4], 7, -176418897);
            d = md5_ff(d, a, b, c, x[i + 5], 12, 1200080426);
            c = md5_ff(c, d, a, b, x[i + 6], 17, -1473231341);
            b = md5_ff(b, c, d, a, x[i + 7], 22, -45705983);
            a = md5_ff(a, b, c, d, x[i + 8], 7, 1770035416);
            d = md5_ff(d, a, b, c, x[i + 9], 12, -1958414417);
            c = md5_ff(c, d, a, b, x[i + 10], 17, -42063);
            b = md5_ff(b, c, d, a, x[i + 11], 22, -1990404162);
            a = md5_ff(a, b, c, d, x[i + 12], 7, 1804603682);
            d = md5_ff(d, a, b, c, x[i + 13], 12, -40341101);
            c = md5_ff(c, d, a, b, x[i + 14], 17, -1502002290);
            b = md5_ff(b, c, d, a, x[i + 15], 22, 1236535329);

            a = md5_gg(a, b, c, d, x[i + 1], 5, -165796510);
            d = md5_gg(d, a, b, c, x[i + 6], 9, -1069501632);
            c = md5_gg(c, d, a, b, x[i + 11], 14, 643717713);
            b = md5_gg(b, c, d, a, x[i + 0], 20, -373897302);
            a = md5_gg(a, b, c, d, x[i + 5], 5, -701558691);
            d = md5_gg(d, a, b, c, x[i + 10], 9, 38016083);
            c = md5_gg(c, d, a, b, x[i + 15], 14, -660478335);
            b = md5_gg(b, c, d, a, x[i + 4], 20, -405537848);
            a = md5_gg(a, b, c, d, x[i + 9], 5, 568446438);
            d = md5_gg(d, a, b, c, x[i + 14], 9, -1019803690);
            c = md5_gg(c, d, a, b, x[i + 3], 14, -187363961);
            b = md5_gg(b, c, d, a, x[i + 8], 20, 1163531501);
            a = md5_gg(a, b, c, d, x[i + 13], 5, -1444681467);
            d = md5_gg(d, a, b, c, x[i + 2], 9, -51403784);
            c = md5_gg(c, d, a, b, x[i + 7], 14, 1735328473);
            b = md5_gg(b, c, d, a, x[i + 12], 20, -1926607734);

            a = md5_hh(a, b, c, d, x[i + 5], 4, -378558);
            d = md5_hh(d, a, b, c, x[i + 8], 11, -2022574463);
            c = md5_hh(c, d, a, b, x[i + 11], 16, 1839030562);
            b = md5_hh(b, c, d, a, x[i + 14], 23, -35309556);
            a = md5_hh(a, b, c, d, x[i + 1], 4, -1530992060);
            d = md5_hh(d, a, b, c, x[i + 4], 11, 1272893353);
            c = md5_hh(c, d, a, b, x[i + 7], 16, -155497632);
            b = md5_hh(b, c, d, a, x[i + 10], 23, -1094730640);
            a = md5_hh(a, b, c, d, x[i + 13], 4, 681279174);
            d = md5_hh(d, a, b, c, x[i + 0], 11, -358537222);
            c = md5_hh(c, d, a, b, x[i + 3], 16, -722521979);
            b = md5_hh(b, c, d, a, x[i + 6], 23, 76029189);
            a = md5_hh(a, b, c, d, x[i + 9], 4, -640364487);
            d = md5_hh(d, a, b, c, x[i + 12], 11, -421815835);
            c = md5_hh(c, d, a, b, x[i + 15], 16, 530742520);
            b = md5_hh(b, c, d, a, x[i + 2], 23, -995338651);

            a = md5_ii(a, b, c, d, x[i + 0], 6, -198630844);
            d = md5_ii(d, a, b, c, x[i + 7], 10, 1126891415);
            c = md5_ii(c, d, a, b, x[i + 14], 15, -1416354905);
            b = md5_ii(b, c, d, a, x[i + 5], 21, -57434055);
            a = md5_ii(a, b, c, d, x[i + 12], 6, 1700485571);
            d = md5_ii(d, a, b, c, x[i + 3], 10, -1894986606);
            c = md5_ii(c, d, a, b, x[i + 10], 15, -1051523);
            b = md5_ii(b, c, d, a, x[i + 1], 21, -2054922799);
            a = md5_ii(a, b, c, d, x[i + 8], 6, 1873313359);
            d = md5_ii(d, a, b, c, x[i + 15], 10, -30611744);
            c = md5_ii(c, d, a, b, x[i + 6], 15, -1560198380);
            b = md5_ii(b, c, d, a, x[i + 13], 21, 1309151649);
            a = md5_ii(a, b, c, d, x[i + 4], 6, -145523070);
            d = md5_ii(d, a, b, c, x[i + 11], 10, -1120210379);
            c = md5_ii(c, d, a, b, x[i + 2], 15, 718787259);
            b = md5_ii(b, c, d, a, x[i + 9], 21, -343485551);

            a = safe_add(a, olda);
            b = safe_add(b, oldb);
            c = safe_add(c, oldc);
            d = safe_add(d, oldd);
        }
        // System.out.println("a= "+a+" b= "+b+" c= "+c+" d= "+d);

        int[] arrmd5 = new int[4];
        arrmd5[0] = a;
        arrmd5[1] = b;
        arrmd5[2] = c;
        arrmd5[3] = d;
        // System.out.println("newarr0= "+arrmd5[0]+" newarr1= "+arrmd5[1]+" newarr2= "+arrmd5[2]+" newarr3= "+arrmd5[3]);
        return arrmd5;
    }

    private static int[] str2binl(String str) {
        int maxIndex = 0;
        for (int i = 0; i < str.length() * chrsz; i += chrsz) {
            maxIndex = Math.max(maxIndex, i >> 5);
        }
        int[] bin = new int[maxIndex + 1];

        int mask = (1 << chrsz) - 1;
        for (int i = 0; i < str.length() * chrsz; i += chrsz)
            bin[i >> 5] |= (str.charAt(i / chrsz) & mask) << (i % 32);

        // System.out.println("bin length "+bin.length);
        // for(int i = 0; i < bin.length; i ++)
        // {
        // System.out.println("bin["+i+"] "+bin[i]);
        // }
        return bin;
    }

    // following three functions are only for encode purpose
    private static int[] compress8to7(String str) {
        int[] arr = new int[str.length() * 7];
        int k = 0;
        for (int i = 0; i < str.length(); i += 8) {
            int val = str.charAt(i) << 1 & 0xfe;
            for (int j = 0; j < 7 && i + j < str.length() + 1; j++) {// System.out.println("str.length() "+str.length()+" i "+i+" j "+j);
                int tmp = 0;
                if (i + j + 1 < str.length()) {
                    tmp = (str.charAt(i + j + 1)) << (j + 2);
                }
                val |= tmp >> 8;
                arr[k++] = (val & 0xff);
                val = tmp & 0xff;
            }
        }
        int[] newarr = new int[k];
        for (int i = 0; i < k; i++) {
            newarr[i] = arr[i];
        }
        return newarr;
    }

    private static String array_to_form(int[] arr) {
        String wbuffer = "";
        int lng = arr.length;
        String str = ""; // "\"";
        for (int i = 0; i < lng; i += 3) {
            int b2 = (i + 1 < lng) ? arr[i + 1] : 0;
            int b3 = (i + 2 < lng) ? arr[i + 2] : 0;
            int triplet = ((arr[i] << 16) & 0xffffff) | ((b2 << 8) & 0xffff) | (b3 & 0xff);
            str += b64_tab.charAt((triplet >> 18) & 0x3f);
            str += b64_tab.charAt((triplet >> 12) & 0x3f);
            if (b2 != 0)
                str += b64_tab.charAt((triplet >> 6) & 0x3f);
            if (b3 != 0)
                str += b64_tab.charAt(triplet & 0x3f);
            if (i % 48 == 45) {
                str += ""; // "\"";
                wbuffer += str;
                if (i < lng - 3)
                    str = ""; // "+\n\"";
            } else {
                if (i >= lng - 3) {
                    str += ""; // "\"";
                    wbuffer += str;
                }
            }
        }

        return wbuffer;
    }

    // this function is for public use.
    public static String decode_sda(String passkey, String plaintext) {

        pnInit(passkey);
        String wbuffer = expand7to8(crypt(b64_to_array(plaintext)));

        return wbuffer;
    }

    // this function is for public use.
    public static String encode_sda(String passkey, String plaintext) {

        pnInit(passkey);
        String result = array_to_form(crypt(compress8to7(plaintext)));

        return result;
    }

    // following use des algroam
    public static String encrypt_des(String passkey, String s) {

        if (passkey == null) {
            throw new IllegalArgumentException("Encryption key is null");
        }
        try {
            KeySpec keySpec = new DESKeySpec(passkey.getBytes("UTF8"));
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            Cipher cipher = Cipher.getInstance("DES");

            cipher.init(Cipher.ENCRYPT_MODE, keyFactory.generateSecret(keySpec));
            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(cipher.doFinal(s.getBytes("UTF8")));
        } catch (Exception e) {
            // log.error("Error encrypting string", e);
            return null;
        }
    }

    public static String decrypt_des(String passkey, String s) {
        if (passkey == null) {
            throw new IllegalArgumentException("Encryption key is null");
        }
        try {
            KeySpec keySpec = new DESKeySpec(passkey.getBytes("UTF8"));
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            Cipher cipher = Cipher.getInstance("DES");

            cipher.init(Cipher.DECRYPT_MODE, keyFactory.generateSecret(keySpec));
            BASE64Decoder decoder = new BASE64Decoder();
            byte[] decrypted = cipher.doFinal(decoder.decodeBuffer(s));
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < decrypted.length; i++) {
                sb.append((char) decrypted[i]);
            }
            return sb.toString();
        } catch (Exception e) {
            // log.error("Error decrypting string", e);
            return null;
        }
    }

    public static String encrypt_md5(String key) {
        return encrypt("MD5", key);
    }

    public static String encrypt(String algorithm, String key) {
        if (algorithm == null || algorithm.trim().equals(""))
            algorithm = "MD5";
        else
            algorithm = algorithm.toUpperCase();

        String result = "";
        MessageDigest messageDigest;
        byte[] l_bytes = null;
        try {
            messageDigest = MessageDigest.getInstance(algorithm);
            messageDigest.update(key.getBytes(), 0, key.length());
            l_bytes = messageDigest.digest();

            StringBuffer sb = new StringBuffer();
            for (int j = 0; j < l_bytes.length; ++j) {
                int b = l_bytes[j] & 0xFF;
                if (b < 0x10)
                    sb.append('0');
                sb.append(Integer.toHexString(b));
            }

            result = sb.toString();

            // System.out.println(result);

        } catch (NoSuchAlgorithmException e) {
            System.out.println("No Such Algorithm Exception");

        }
        return result;
    }

    public static String getRandomString() {
        int lnum1 = (int) (100000 * Math.random());
        int lnum2 = (int) (100000 * Math.random());
        String[] arry = { "n", "_", "p", "7", "K", "s", "e", "w", "1", "Z" };
        String str = String.valueOf(lnum2);
        String temp = "";
        int index = 0;

        for (int i = 0; i < str.length(); i++) {
            index = Integer.parseInt(String.valueOf(str.charAt(i)));
            temp += arry[index];
        }
        temp += String.valueOf(lnum1);
        return temp;
    }

    public static String getRandomKey() {
        int lnum1 = (int) (1000000000 * Math.random());
        int lnum2 = (int) (1000000000 * Math.random());
        String[][] arry =
            { { "0", "_", "p", "7", "K", "s", "e", "w", "1", "f" }, { "1", "A", "q", "t", "9", "u", "b", "x", "a", "g" },
                { "2", "f", "j", "3", "V", "B", "n", "l", "r", "e" }, { "3", "z", "s", "F", "g", "I", "o", "y", "c", "Z" },
                { "4", "M", "d", "T", "6", "_", "k", "r", "L", "q" }, { "5", "h", "J", "w", "r", "Q", "x", "s", "_", "j" },
                { "6", "N", "v", "g", "o", "R", "a", "2", "m", "D" }, { "7", "x", "H", "p", "i", "D", "z", "l", "o", "a" },
                { "8", "v", "Z", "4", "_", "e", "g", "q", "n", "W" }, { "9", "C", "_", "v", "E", "w", "k", "s", "H", "Z" } };
        String str = String.valueOf(lnum1);
        String temp = "";
        int index = 0;
        int keyIndex = (int) (10 * Math.random());
        for (int i = 0; i < str.length(); i++) {
            index = Integer.parseInt(String.valueOf(str.charAt(i)));
            temp += arry[keyIndex][index];
        }
        str = String.valueOf(lnum2);
        keyIndex = (int) (10 * Math.random());
        for (int i = 0; i < str.length(); i++) {
            index = Integer.parseInt(String.valueOf(str.charAt(i)));
            temp += arry[keyIndex][index];
        }

        if (temp.length() < 18) {
            int length = 18 - temp.length();
            for (int i = 0; i < length; i++) {
                keyIndex = (int) (10 * Math.random());
                temp = temp + String.valueOf(keyIndex);
            }
        }
        return temp;
    }

    public static void main(String[] args) {
        // String passkey = getRandomKey(); //"sagasgsahgsah";
        // System.out.println("passkey "+passkey);
        // String input =
        // "drehreuuer 4373474387 547458548/nssd gsdgwe43w4343!@$@!%!^@&$# &REUHERJHREJ %$&U%$&%$*%$";
        // System.out.println("input "+input);
        // String output = MySecurity.encrypt_des(passkey, input);
        // System.out.println("output "+output);
        //
        // String result = MySecurity.decrypt_des(passkey, output);
        // System.out.println("result "+result);

        // sda test
        // MySecurity sda = new MySecurity();
        String passkey1 = "2FdHR59fDds_dRdRs";
        System.out.println("key: " + passkey1);
        String input1 = "111111";// "drehreuuer 4373474387 547458548/nssd gsdgwe43w4343!@$@!%!^@&$# &REUHERJHREJ %$&U%$&%$*%$";
        System.out.println("input1 " + input1);
        String optput1 = encode_sda(passkey1, input1);
        System.out.println("optput1: " + optput1);
        String wbuffer = decode_sda(passkey1, "HSRoYZHtDg");
        System.out.println("wbuffer " + wbuffer);
    }

}
