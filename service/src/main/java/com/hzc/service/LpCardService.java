package com.hzc.service;

import com.hzc.factory.alias.D;
import com.qtrj.simpleframework.ssh.service.TrancationType;
import com.qtrj.simpleframework.ssh.service.Transaction;
import com.hzc.model.LpCard;
import com.hzc.model.SysCompany;
import com.hzc.model.SysSeat;
import com.hzc.model.SysUser;
import com.hzc.util.alias.S;
import com.hzc.vo.SysSeatVO;
import com.hzc.vo.SysUserVO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 准考证类
 * 说明：
 * 提供准考证相关方法
 * 打印准考证，生成准考证
 * Created by HZC on 2015/5/26.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class LpCardService {

    /**
     * 查询管理员权限
     * 说明：
     * 根据companyId和password验证登录信息
     *
     * @param id       companyId
     * @param password 密码
     * @return true:登录信息合法，false：登录信息不合法
     */
    public boolean checkPermission(Integer id, String password) {
        SysCompany company = S.sysCompanyService().getCompanyById(id);
        return company.getPassword().equals(password) ? true : false;
    }

    /**
     * 查询单位下的所有已报名用户
     * 说明：
     * 根据companyId查询该单位下的所有已报名用户信息
     *
     * @param companyId 查询的单位
     * @return List<SysUser>
     */
    public List<SysUser> getUserInfo(Integer companyId) {
        return D.sysUserMapper().selectByCompanyId(companyId);
    }

    /**
     * 设置用户为闭卷考试
     * 说明：
     * 用户状态为4
     *
     * @param userIds userIds
     */
    public void setClosedBookExam(Integer[] userIds) {
        S.sysUserService().updateStatusById(userIds, 4);
    }


    /**
     * 保存准考证
     * <pre>
     *     说明：
     *     将产生的准考证保存到数据库（新建）
     * </pre>
     *
     * @param list 准考证
     */
    @Transaction(jdbc = TrancationType.OPEN)
    private void saveCards(List<LpCard> list) {
        D.lpCardMapper().insertCards(list);
    }

    /**
     * 生成准考证
     * <pre>
     *     说明：
     *      为用户生成准考证，保存到准考证表
     *      同时更新用户到座位表
     *      成功返回true
     *      失败返回false
     * </pre>
     *
     * @param userIds userIds
     * @return 成功：true，失败：false
     */
    public synchronized boolean createCard(Integer[] userIds) throws Exception {
        List<SysSeat> sysEmptySeats = S.sysSeatService().get();
        //第一次生成准考证，如果坐位为空，则生成空座位
        if (sysEmptySeats.isEmpty()) {
            S.sysSeatService().createSeat();
        }
        int usersNO = userIds.length;
        //获取随机的空座位
        List<SysSeatVO> seatVoList = S.sysSeatService().shuffleSeat(usersNO);
        //获取考试人的信息
        List<SysUserVO> userList = S.sysUserService().getUsersById(userIds);
        if (usersNO != seatVoList.size() || usersNO != userList.size() || seatVoList.size() != userList.size()) {
//            throw new Exception("hzc exception: input is not equals output.");
            return false;
        }
        //空座位赋值考试人
        List<SysSeatVO> seatList = new ArrayList<SysSeatVO>();
        //准考证
        List<LpCard> cardList = new ArrayList<LpCard>();

        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy");
        String year = format.format(date);
        //为每一个空座位设置考试人
        for (int i = 0; i < userIds.length; i++) {
            SysSeatVO seatVO = seatVoList.get(i);
            SysUserVO user = userList.get(i);
            seatVO.setUserId(userIds[i]);
            seatVO.setUpdateTime(date);
            seatList.add(seatVO);
            LpCard card = new LpCard();
            card.setName(user.getUserName());
            Integer roomNo = seatVO.getRoomNo();
            Integer seatNo = seatVO.getSeatNo();
            String roomNoStr = roomNo < 10 ? "0" + String.valueOf(roomNo) : String.valueOf(roomNo);
            String seatNoStr = seatNo < 10 ? "0" + String.valueOf(seatNo) : String.valueOf(seatNo);
            String cardNo = "320200" + year + roomNoStr + seatNoStr;
            card.setCardNo(cardNo);
            card.setBirthday(user.getBirthday());
            card.setSex(user.getSex() == 1 ? "男" : "女");
            card.setCompany(user.getCompanyName());
            card.setJobGrade(user.getJobGrade());
            card.setExamStartTime(seatVO.getStartTime());
            card.setExamEndTime(seatVO.getEndTime());
            card.setAddress(seatVO.getRoomAddress());
            card.setRoomNo(seatVO.getRoomNo());
            card.setSeatNo(seatVO.getSeatNo());
            card.setPhotoPath(user.getPhotoPath());
            card.setUpdateTime(date);
            card.setCreateTime(date);
            card.setDeleted(1);
            card.setUserId(user.getId());
            cardList.add(card);
        }
        S.lpCardService().saveCards(cardList);
        S.sysSeatService().fillUser(seatList);
        S.sysUserService().updateStatusById(userIds, 4);
        return true;
    }

    /**
     * 根据id获取准考证
     *
     * @param id
     * @return
     */
    public LpCard getById(Integer id) {
        return D.lpCardMapper().selectByPrimaryKey(id);
    }

    /**
     * 返回准考证信息
     * <pre>
     *     根据userId查询该用户的答题卡
     * </pre>
     * @param userId
     * @return
     */
    public LpCard getByUserId(Integer userId) {
        return D.lpCardMapper().selectByUserId(userId);
    }
}
