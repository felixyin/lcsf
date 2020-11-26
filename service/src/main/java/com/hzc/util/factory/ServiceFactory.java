package com.hzc.util.factory;

import com.hzc.service.*;

/**
 * @author yinbin
 */

public class ServiceFactory {

    public static <T> T get(Class<T> t) {
        return com.qtrj.simpleframework.ssh.service.ServiceFactory.getInstance(t);
    }

    public static ExamService examService() {
        return get(ExamService.class);
    }

    public static LpCardService lpCardService() {
        return get(LpCardService.class);
    }

    public static LpEnrollmentService lpEnrollmentService() {
        return get(LpEnrollmentService.class);
    }

    public static LpQuestionService lpQuestionService() {
        return get(LpQuestionService.class);
    }

    public static LpSyncService lpSyncService() {
        return get(LpSyncService.class);
    }

    public static SysCompanyService sysCompanyService() {
        return get(SysCompanyService.class);
    }

    public static SysConfigService sysConfigService() {
        return get(SysConfigService.class);
    }

    public static SysMessageService sysMessageService() {
        return get(SysMessageService.class);
    }

    public static SysResourceService sysResourceService() {
        return get(SysResourceService.class);
    }

    public static SysSeatService sysSeatService() {
        return get(SysSeatService.class);
    }

    public static SysUserService sysUserService() {
        return get(SysUserService.class);
    }

    public static ManageService manageService() {
        return get(ManageService.class);
    }

    public static ReportServcie reportServcie() {
        return get(ReportServcie.class);
    }

    public static HisAnswerService hisAnswerService() {
        return get(HisAnswerService.class);
    }

    public static PufaImportService pufaImportService() {
        return get(PufaImportService.class);
    }

    public static GenExamService genExamService() {
        return get(GenExamService.class);
    }

    public static ManagementService managementService() {
        return get(ManagementService.class);
    }

    public static HisPaperItemService HisPaperItemService() {
        return  get(HisPaperItemService.class);
    }
}


