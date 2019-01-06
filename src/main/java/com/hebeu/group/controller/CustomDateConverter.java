package com.hebeu.group.controller;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 言立慧
 * 描述：字符串时间转Date类型时间
 */
public class CustomDateConverter implements Converter<String,Date> {
	@Override
	public Date convert(String source) {
		
		//实现 将日期串转成日期类型(格式是yyyy-MM-dd HH:mm:ss)
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			//如果为空字符串直接返回null
			if ("".equals(source)){
				return null;
			}
			//转成自定义的格式类型直接返回
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//如果参数绑定失败返回null
		return null;
	}

}
