package com.hebeu.group.pojo;

public class ShopCart {
    private Integer sId;

    private String cName;

    private String bId;

    private String bName;

    private Double bPrice;

    private Integer bNumber;

    private String bImage;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId == null ? null : bId.trim();
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName == null ? null : bName.trim();
    }

    public Double getbPrice() {
        return bPrice;
    }

    public void setbPrice(Double bPrice) {
        this.bPrice = bPrice;
    }

    public Integer getbNumber() {
        return bNumber;
    }

    public void setbNumber(Integer bNumber) {
        this.bNumber = bNumber;
    }

    public String getbImage() {
        return bImage;
    }

    public void setbImage(String bImage) {
        this.bImage = bImage == null ? null : bImage.trim();
    }
}