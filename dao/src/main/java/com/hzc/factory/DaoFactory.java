package com.hzc.factory;

import com.qtrj.simpleframework.ssh.service.Context;
import com.hzc.dao.*;

/**
 * Created by YinBin on 14-4-21.
 */
public class DaoFactory {

    public static <T> T get(Class<T> t) {
        return Context.getSqlSession().getMapper(t);
    }

    public static HisAnswerMapper hisAnswerMapper() {
        return get(HisAnswerMapper.class);
    }

    public static HisCollectionMapper hisCollectionMapper() {
        return get(HisCollectionMapper.class);
    }

    public static HisPaperItemMapper hisPaperItemMapper() {
        return get(HisPaperItemMapper.class);
    }

    public static HisPaperMapper hisPaperMapper() {
        return get(HisPaperMapper.class);
    }

    public static LpCardMapper lpCardMapper() {
        return get(LpCardMapper.class);
    }

    public static LpCategoryMapper lpCategoryMapper() {
        return get(LpCategoryMapper.class);
    }

    public static LpMaterialMapper lpMaterialMapper() {
        return get(LpMaterialMapper.class);
    }

    public static LpOptionMapper lpOptionMapper() {
        return get(LpOptionMapper.class);
    }

    public static LpQuestionMapper lpQuestionMapper() {
        return get(LpQuestionMapper.class);
    }

    public static LpResolutionMapper lpResolutionMapper() {
        return get(LpResolutionMapper.class);
    }

    public static SysCompanyMapper sysCompanyMapper() {
        return get(SysCompanyMapper.class);
    }

    public static SysConfigMapper sysConfigMapper() {
        return get(SysConfigMapper.class);
    }

    public static SysMessageMapper sysMessageMapper() {
        return get(SysMessageMapper.class);
    }

    public static SysResourceMapper sysResourceMapper() {
        return get(SysResourceMapper.class);
    }

    public static SysSeatMapper sysSeatMapper() {
        return get(SysSeatMapper.class);
    }

    public static SysUserMapper sysUserMapper() {
        return get(SysUserMapper.class);
    }

    public static PufaImportMapper pufaImportMapper() {
        return get(PufaImportMapper.class);
    }

    public static GenExamRepoMapper genExamRepoMapper() {
        return get(GenExamRepoMapper.class);
    }
}
