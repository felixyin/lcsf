package encoding;

import com.hzc.model.SysUser;
import com.hzc.service.SupperJunit;
import com.hzc.util.alias.S;
import org.junit.Test;

/**
 * Created by yinbin on 2015/6/27.
 */
public class EncodingResloveTest extends SupperJunit {

    @Test
    public void printEncoding() {

        String[] idCards = new String[]{"220602199007150640", "370214199007224829", "370221196709306511", "370221197310204032", "370284196602099036", "370205197401166019", "370214197103068513", "37022119640106160X", "370212196810226536", "370221196304070029", "370221195909280032", "370206196804294025", "37022119720715556X", "370221195604060012", "370202195712014938", "370206196608303617", "370205195609281535", "370213198107315225", "370205196505122550", "370203196505277015"};
        for (String idCard : idCards) {
            SysUser sysUser = S.sysUserService().selectUserByIdCard(idCard);
            System.out.println(sysUser);

        }
    }
}
