package com.hebeu.group.service;

import com.hebeu.group.pojo.Comment;

import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/28 10:20
 * 评论服务层接口
 */

public interface CommentService {
    /**
     * 通过书籍id查询评论列表
     * @param bId
     * @return
     */
    List<Comment> selectCommentByBookId(String bId);
}
