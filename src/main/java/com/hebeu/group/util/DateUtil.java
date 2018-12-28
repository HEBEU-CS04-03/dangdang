package com.hebeu.group.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 言立慧
 * @date 2018/12/27 16:44
 * 日期格式转换类
 */

public class DateUtil {
    /**
     * 将日期转换格式
     * @param date
     * @return
     */
    public static String formateTime(Date date) {
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        return df.format(date);
    }
}
