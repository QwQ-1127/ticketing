package com.flight.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;

/**
 * 封装dbutil和c3p0的重复内容，直接返回QueryRunner对象
 */
public class C3p0Util {
    private static ComboPooledDataSource dataSource = new ComboPooledDataSource();
    /**
     * 返回queryrunner
     */
    public static QueryRunner getQr(){
        return new QueryRunner(dataSource);
    }
}
