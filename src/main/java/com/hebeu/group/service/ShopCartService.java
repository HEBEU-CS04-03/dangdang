package com.hebeu.group.service;

import com.hebeu.group.pojo.OrderRecord;
import com.hebeu.group.pojo.Orders;
import com.hebeu.group.pojo.ShopCart;

import java.util.List;

/**
 * @author 雷宇飞
 * @date 2018-12-24 15:33
 * 购物车接口
 */
public interface ShopCartService {

    /**
     * 新增图书到购物车
     * @param shopCart 购物车po
     */
    void addBookToShopCart(ShopCart shopCart);

    /**
     * 删除购物车中图书
     * @param sid 购物车sid
     */
    void deleteBookFromShopCart(Integer sid);

    /**
     * 更新购物车
     * @param shopCart 购物车po
     */
    void updateShopCart(ShopCart shopCart);

    /**
     * 通过id查询购物车图书信息
     * @param sid sid
     * @return  购物车po
     */
    ShopCart selectShopCartById(Integer sid);

    /**
     * 通过用户名查询购物车列表信息
     * @param cName 用户名
     * @return 购物车集合
     */
    List<ShopCart> selectShopCartByCName(String cName);

    /**
     * 通过用户名和图书id查询购物车信息
     * @param cName 用户名
     * @param BId 图书id
     * @return 购物车信息
     */
    ShopCart selectShopCartByCNameAndBId(String cName,String BId);

    /**
     * 添加订单
     * @param orders 订单
     */
    void insertOrder(Orders orders);

    /**
     * 插入订单详情
     * @param orderRecordList 订单详情
     */
    void insertOrderRecord(List<OrderRecord> orderRecordList);
}
