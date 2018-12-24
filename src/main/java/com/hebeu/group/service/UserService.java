package com.hebeu.group.service;

/**
 * @author 言立慧
 * @date 2018/12/24 10:47
 */

public interface UserService {
    /**
     * 用户登录方法
     * @param name
     * @param password
     */
    void login(String name, String password);
}
