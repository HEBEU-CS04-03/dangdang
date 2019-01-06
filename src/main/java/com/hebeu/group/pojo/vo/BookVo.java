package com.hebeu.group.pojo.vo;

import com.hebeu.group.pojo.Book;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author 言立慧
 * @date 2019/1/6 16:44
 */

public class BookVo extends Book {
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
