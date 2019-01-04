package com.hebeu.group.pojo;

public class Customer {
    private String cName;

    private String cPass;

    private String cPhone;

    private String cAddress;

    private String cEmail;

    private Integer cScore;

    private Double cBlance;

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getcPass() {
        return cPass;
    }

    public void setcPass(String cPass) {
        this.cPass = cPass == null ? null : cPass.trim();
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone == null ? null : cPhone.trim();
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress == null ? null : cAddress.trim();
    }

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail == null ? null : cEmail.trim();
    }

    public Integer getcScore() {
        return cScore;
    }

    public void setcScore(Integer cScore) {
        this.cScore = cScore;
    }

    public Double getcBlance() {
        return cBlance;
    }

    public void setcBlance(Double cBlance) {
        this.cBlance = cBlance;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "cName='" + cName + '\'' +
                ", cPass='" + cPass + '\'' +
                ", cPhone='" + cPhone + '\'' +
                ", cAddress='" + cAddress + '\'' +
                ", cEmail='" + cEmail + '\'' +
                ", cScore=" + cScore +
                ", cBlance=" + cBlance +
                '}';
    }
}