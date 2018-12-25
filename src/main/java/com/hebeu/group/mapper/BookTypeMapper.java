package com.hebeu.group.mapper;

import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.BookTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookTypeMapper {
    long countByExample(BookTypeExample example);

    int deleteByExample(BookTypeExample example);

    int deleteByPrimaryKey(Integer tId);

    int insert(BookType record);

    int insertSelective(BookType record);

    List<BookType> selectByExample(BookTypeExample example);

    BookType selectByPrimaryKey(Integer tId);

    int updateByExampleSelective(@Param("record") BookType record, @Param("example") BookTypeExample example);

    int updateByExample(@Param("record") BookType record, @Param("example") BookTypeExample example);

    int updateByPrimaryKeySelective(BookType record);

    int updateByPrimaryKey(BookType record);
}