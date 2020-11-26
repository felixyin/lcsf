package com.hzc.top;

import com.hzc.model.SysUser;
import com.hzc.util.alias.S;
import com.hzc.util.utils.MySecurity;
import com.hzc.util.utils.SecurityConstants;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;

/**
 * Created by yinbin on 2015/3/28.
 */

public class MyTest extends SupperJunit {
    @Test
    public void selectCurriculumNote() {
        SysUser resultVO = S.sysUserService().getUserByPhone("15854207636");
        System.out.println(resultVO);
    }

    @Test
    public void jiaMi() {
        String qqqqqq = MySecurity.encode_sda(SecurityConstants.LOGIN_PASSKEY, "qqqqqq");
        System.out.println(qqqqqq);
    }
    @Test
    public void testJSON(){
        String s = "[{\"name\":\"496\",\"val\":{\"ua\":\"B\",\"qa\":\"A\",\"ur\":\"false\"}},{\"name\":\"459\",\"val\":{\"ua\":\"A\",\"qa\":\"A\",\"ur\":\"true\"}},{\"name\":\"443\",\"val\":{\"ua\":\"B\",\"qa\":\"B\",\"ur\":\"true\"}},{\"name\":\"352\",\"val\":{\"ua\":\"A\",\"qa\":\"A\",\"ur\":\"true\"}},{\"name\":\"1271\",\"val\":{}},{\"name\":\"635\",\"val\":{}},{\"name\":\"537\",\"val\":{}},{\"name\":\"1112\",\"val\":{}},{\"name\":\"1499\",\"val\":{}},{\"name\":\"1720\",\"val\":{}}]";
        JSONArray jsonArray = JSONArray.fromObject(s);
        Object[] array = jsonArray.toArray();
        for (int i = 0; i < array.length; i++) {
            Object o = array[i];
            JSONObject jsonObject = JSONObject.fromObject(o);
            String qid = jsonObject.getString("name");
            JSONObject val = jsonObject.getJSONObject("val");
            String ua = val.getString("ua");
            String qa = val.getString("qa");
            String ur = val.getString("ur");
        }


    }
}
