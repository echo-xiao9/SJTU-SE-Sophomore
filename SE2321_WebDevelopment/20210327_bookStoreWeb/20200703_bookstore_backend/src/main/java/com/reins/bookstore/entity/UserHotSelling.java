package com.reins.bookstore.entity;

import java.util.List;

public class UserHotSelling {
    private List<HotSelling> hotSellingList;
    private Integer totalPrice;
    private Integer totalNum;

    public UserHotSelling(List<HotSelling> hotSellingList, Integer totalPrice, Integer totalNum) {
        this.hotSellingList = hotSellingList;
        this.totalPrice = totalPrice;
        this.totalNum = totalNum;
    }

    public List<HotSelling> getHotSellingList() {
        return hotSellingList;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setHotSellingList(List<HotSelling> hotSellingList) {
        this.hotSellingList = hotSellingList;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }
}
