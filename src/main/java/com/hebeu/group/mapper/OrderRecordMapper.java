package com.hebeu.group.mapper;

import com.hebeu.group.pojo.OrderRecord;
import com.hebeu.group.pojo.OrderRecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderRecordMapper {
    long countByExample(OrderRecordExample example);

    int deleteByExample(OrderRecordExample example);

    int deleteByPrimaryKey(String cName);

    int insert(OrderRecord record);

    int insertSelective(OrderRecord record);

    List<OrderRecord> selectByExample(OrderRecordExample example);

    OrderRecord selectByPrimaryKey(String cName);

    int updateByExampleSelective(@Param("record") OrderRecord record, @Param("example") OrderRecordExample example);

    int updateByExample(@Param("record") OrderRecord record, @Param("example") OrderRecordExample example);

    int updateByPrimaryKeySelective(OrderRecord record);

    int updateByPrimaryKey(OrderRecord record);
}