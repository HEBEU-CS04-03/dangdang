package com.hebeu.group.pojo;

import java.util.Date;

public class Book {
    private String bId;

    private Integer tId;

    private String bName;

    private Float bPrice;

    private String bImage;

    private Integer bQuantity;

    private String bDescription;

    private Date bTime;

    private String bAuthor;

    private String bPress;

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId == null ? null : bId.trim();
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName == null ? null : bName.trim();
    }

    public Float getbPrice() {
        return bPrice;
    }

    public void setbPrice(Float bPrice) {
        this.bPrice = bPrice;
    }

    public String getbImage() {
        return bImage;
    }

    public void setbImage(String bImage) {
        this.bImage = bImage == null ? null : bImage.trim();
    }

    public Integer getbQuantity() {
        return bQuantity;
    }

    public void setbQuantity(Integer bQuantity) {
        this.bQuantity = bQuantity;
    }

    public String getbDescription() {
        return bDescription;
    }

    public void setbDescription(String bDescription) {
        this.bDescription = bDescription == null ? null : bDescription.trim();
    }
    public Date getbTime() {
        return bTime;
    }

    public void setbTime(Date bTime) {
        this.bTime = bTime;
    }

    public String getbAuthor() {
        return bAuthor;
    }

    public void setbAuthor(String bAuthor) {
        this.bAuthor = bAuthor == null ? null : bAuthor.trim();
    }

    public String getbPress() {
        return bPress;
    }

    public void setbPress(String bPress) {
        this.bPress = bPress == null ? null : bPress.trim();
    }

    @Override
    public String toString() {
        return "Book{" +
                "bId='" + bId + '\'' +
                ", tId=" + tId +
                ", bName='" + bName + '\'' +
                ", bPrice=" + bPrice +
                ", bImage='" + bImage + '\'' +
                ", bQuantity=" + bQuantity +
                ", bDescription='" + bDescription + '\'' +
                ", bTime=" + bTime +
                ", bAuthor='" + bAuthor + '\'' +
                ", bPress='" + bPress + '\'' +
                '}';
    }
}