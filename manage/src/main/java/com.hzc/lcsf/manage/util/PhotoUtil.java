package com.hzc.lcsf.manage.util;

import org.apache.log4j.Logger;
import sun.misc.BASE64Encoder;

import java.io.FileInputStream;
import java.io.IOException;

/**
 * Created by HZC on 2015/6/9.
 */
public class PhotoUtil {

    private static Logger log = Logger.getLogger(PhotoUtil.class);

    /**
     * 将图片文件转化为字节数组字符串，并进行Base64编码处理
     *
     * @param path 文件路径
     * @return 经过Base64编码的字节数组字符串
     */
    public static String getImageString(String path) throws IOException {
        byte[] data = null;

        FileInputStream stream = new FileInputStream(path);
        try {
            data = new byte[stream.available()];
            stream.read(data);
        } catch (IOException e) {
            log.error("hzc exception:" + e);
        } finally {
            stream.close();
        }
        BASE64Encoder decoder = new BASE64Encoder();
        return decoder.encode(data);
    }
}
