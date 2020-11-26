package com.hzc.vo;

import com.hzc.framework.ssh.controller.UploadFileCall;
import com.hzc.model.SysUser;
import com.hzc.util.alias.S;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by LiuJY on 2015/6/5.
 */
public class UploadUserCall extends UploadFileCall {

    private static Logger log = Logger.getLogger(UploadUserCall.class);

    /**
     *
     */
    private String disk;
    /**
     *
     */
    private String target_folder;

    /**
     * @param disk          本项目 存储文件的根目录，举例：/var/local/lcsf_lts
     * @param target_folder 存储文件的相对目录（相对于根目录）：/upload/photo
     */
    public UploadUserCall(String disk, String target_folder) {
        this.disk = disk;
        this.target_folder = target_folder;
    }

    /**
     * 校验上传图片是否过大
     *
     * @param f
     * @throws IOException
     */
    private void check(File f) throws IOException {
        long size = FileUtils.sizeOf(f);
        if (size > 1024 * 100) {
            FileUtils.deleteQuietly(f);
            throw new RuntimeException("图片不能超过100k");
        }
    }

    /**
     * TODO  应该 将此方法抽象一下，移动到UploadFileCall这个抽象类中
     * 保存文件
     * <pre>
     *     保存文件到硬盘
     *     并且重命名文件
     * </pre>
     *
     * @param sourceFile 原文件
     * @param idCard     新文件名
     * @return
     * @throws java.io.IOException
     */
    private String saveFile(File sourceFile, String idCard) throws IOException {
        String targetFolder = disk + target_folder;
        FileUtils.forceMkdir(new File(targetFolder));

        String targetPath = targetFolder + File.separator + idCard + FilenameUtils.EXTENSION_SEPARATOR + FilenameUtils.getExtension(sourceFile.getName());
        File targetFile = new File(targetPath);

//        FileUtils.deleteQuietly(targetFile);
        try {
            targetFile.delete();
        } catch (Exception e) {
        }
        FileUtils.moveFile(sourceFile, targetFile);

        return targetPath;
    }

    /**
     * 保存用户信息
     * <pre>
     *     包括用户的图片路径
     * </pre>
     *
     * @param sysUser
     * @param filePath
     */
    private void saveSysUser(SysUser sysUser, String filePath) {
        Date date = new Date();
        sysUser.setUpdateTime(date);
        sysUser.setEnrollmentTime(date);
        sysUser.setPhotoPath(filePath);
        sysUser.setStatus(3);

        S.sysUserService().enrollUser(sysUser);
    }

    @Override
    public <T> void file(T obj, File f, String filename, String originalFilename, String type) throws Exception {
        check(f);

        SysUser sysUser = (SysUser) obj;

        String filePath = saveFile(f, sysUser.getIdCard());

        saveSysUser(sysUser, filePath);
    }

}
