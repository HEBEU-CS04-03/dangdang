package com.hebeu.group.util;

import com.hebeu.group.pojo.Admin;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 管理员登录验证
 *
 * @author 言立慧
 * @date 2019/1/6 14:50
 */
@Component
public class CheckLoginInterceptor implements HandlerInterceptor {
    /**
     * 当管理员登录信息为空时返回false，否则true
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Admin admin = (Admin) httpServletRequest.getSession().getAttribute("admin");
        if (admin != null) {
            return true;
        } else {
            httpServletResponse.sendRedirect("/admin/toLogin");
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
