package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.CommentMapper;
import com.hebeu.group.pojo.Comment;
import com.hebeu.group.pojo.CommentExample;
import com.hebeu.group.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/28 10:21
 * 评论服务实现
 */
@Service
public class CommentServiceImpl implements CommentService {
    private CommentMapper commentMapper;

    @Autowired
    public CommentServiceImpl(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public List<Comment> selectCommentByBookId(String bId) {
        CommentExample commentExample = new CommentExample();
        CommentExample.Criteria criteria = commentExample.createCriteria();
        criteria.andBIdEqualTo(bId);
        return commentMapper.selectByExample(commentExample);
    }
}
