package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.service.Context;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.PufaImport;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 * Created by yinbin on 2015/4/10.
 */
@Transaction
public class PufaImportService {

    @Transaction(jdbc = TrancationType.CLOSE)
    public List<PufaImport> loadAll() {
        return D.pufaImportMapper().selectAll();
    }

    public void executeSql(List<String> sqls) throws SQLException {
        Connection connection = Context.getSqlSession().getConnection();
        try {
            connection.setAutoCommit(false);
            Statement statement = connection.createStatement();
//            System.out.println(sql);
            for (String sql : sqls) {
                int execute = statement.executeUpdate(sql);
                System.out.println(execute + "-->" + sql);
            }
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
            connection.rollback();
        } finally {
//            connection.close();
        }
    }


}
