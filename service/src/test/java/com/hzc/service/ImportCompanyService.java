package com.hzc.service;

import com.hzc.factory.alias.D;
import com.qtrj.simpleframework.ssh.service.Transaction;
import com.hzc.model.SysCompany;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by yinbin on 2015/5/29.
 */
@Transaction
public class ImportCompanyService extends SupperJunit {

    @Test
    public void importCompany() throws Exception {
        final String[] split = getCompanyArray();
        new DaoCommit() {
            @Override
            public void invoke() throws IOException {
                for (String s : split) {
                    SysCompany bean = new SysCompany();
                    bean.setName(s.trim());
                    bean.setUpdateTime(new Date());
                    bean.setDeleted(1);
                    D.sysCompanyMapper().insert(bean);
                }
            }
        }.execute();
    }

    private String[] getCompanyArray() throws IOException {
        List<String> list = new ArrayList<String>();
        InputStream inputStream = this.getClass().getResourceAsStream("/company.txt");
        List<String> strings = IOUtils.readLines(inputStream);
        String text = "";
        for (String string : strings) {
            text += string + "、";
        }
        String[] split = text.split("、");
        int length = (split.length - 1);
        for (int i = 0; i < length; i++) {
            String s = split[i];
            if (StringUtils.isBlank(s)) continue;
            list.add(s);
        }
        return list.toArray(new String[]{});
    }


}
