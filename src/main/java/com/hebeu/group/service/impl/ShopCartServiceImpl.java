package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.BookMapper;
import com.hebeu.group.mapper.OrderRecordMapper;
import com.hebeu.group.mapper.OrdersMapper;
import com.hebeu.group.mapper.ShopCartMapper;
import com.hebeu.group.pojo.*;
import com.hebeu.group.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 雷宇飞
 * @date 2018-12-24 15:33
 * 购物车接口实体类
 */
@Service
public class ShopCartServiceImpl implements ShopCartService {

    private ShopCartMapper shopCartMapper;
    private BookMapper bookMapper;
    private OrdersMapper ordersMapper;
    private OrderRecordMapper orderRecordMapper;

    @Autowired
    public ShopCartServiceImpl(ShopCartMapper shopCartMapper, BookMapper bookMapper, OrdersMapper ordersMapper, OrderRecordMapper orderRecordMapper) {
        this.shopCartMapper = shopCartMapper;
        this.bookMapper = bookMapper;
        this.ordersMapper = ordersMapper;
        this.orderRecordMapper = orderRecordMapper;
    }

    @Override
    public void addBookToShopCart(ShopCart shopCart){

        Book book = bookMapper.selectByPrimaryKey(shopCart.getbId());
        shopCart.setbImage(book.getbImage());
        shopCart.setbName(book.getbName());
        shopCart.setbPrice((double)book.getbPrice());
        try {
            shopCartMapper.insertSelective(shopCart);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("插入购物车失败！");
        }
    }

    @Override
    public void deleteBookFromShopCart(Integer sid) {
        try {
            shopCartMapper.deleteByPrimaryKey(sid);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("删除购物车图书失败！");
        }
    }

    @Override
    public void updateShopCart(ShopCart shopCart) {
        try {
            shopCartMapper.updateByPrimaryKeySelective(shopCart);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("更新购物车信息失败！");
        }
    }

    @Override
    public ShopCart selectShopCartById(Integer sid) {
        return shopCartMapper.selectByPrimaryKey(sid);
    }

    @Override
    public List<ShopCart> selectShopCartByCName(String cName) {
        ShopCartExample shopCartExample = new ShopCartExample();
        ShopCartExample.Criteria criteria = shopCartExample.createCriteria();
        criteria.andCNameEqualTo(cName);
        return shopCartMapper.selectByExample(shopCartExample);
    }

    @Override
    public ShopCart selectShopCartByCNameAndBId(String cName, String bId) {
        ShopCartExample shopCartExample = new ShopCartExample();
        ShopCartExample.Criteria criteria = shopCartExample.createCriteria();
        criteria.andCNameEqualTo(cName);
        criteria.andBIdEqualTo(bId);
        List<ShopCart> shopCartList = shopCartMapper.selectByExample(shopCartExample);
        if(shopCartList.size()==0){
            return null;
        }else {
            return shopCartList.get(0);
        }
    }

    @Override
    public void insertOrder(Orders orders) {
        try {
            ordersMapper.insert(orders);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void insertOrderRecord(List<OrderRecord> orderRecordList) {
        try {
            for (OrderRecord orderRecord : orderRecordList){
                orderRecordMapper.insertSelective(orderRecord);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
