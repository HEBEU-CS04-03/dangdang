package com.hebeu.group.pojo;

public class BookTypeCount extends BookType {
    Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "BookTypeCount{" +
                "count=" + count +
                '}';
    }
}
