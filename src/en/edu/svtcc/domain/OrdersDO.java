package en.edu.svtcc.domain;

import java.util.ArrayList;
import java.util.Date;

/**
 * 订单实体类
 * Author:JDH
 * Date：2021/10/29
 *
 */
public class OrdersDO extends Object{
    private String orderid;
    private int quantity;
    private double totalprice;
    private Date orderdate;
    private String receiver;
    private String address;
    private String tel;
    private int userid;
    private ArrayList<OrderDtailsDO> details;

    public OrdersDO() {

    }

    public OrdersDO(String orderid, int quantity, double totalprice, Date orderdate, String receiver, String address,
                    String tel, int userid,ArrayList<OrderDtailsDO> details) {
        this.orderid = orderid;
        this.quantity = quantity;
        this.totalprice = totalprice;
        this.orderdate = orderdate;
        this.receiver = receiver;
        this.address = address;
        this.tel = tel;
        this.userid = userid;
        this.details=details;
    }

    public ArrayList<OrderDtailsDO> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<OrderDtailsDO> details) {
        this.details = details;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "OrdersDO{" +
                "orderid='" + orderid + '\'' +
                ", quantity=" + quantity +
                ", totalprice=" + totalprice +
                ", orderdate=" + orderdate +
                ", receiver='" + receiver + '\'' +
                ", address='" + address + '\'' +
                ", tel='" + tel + '\'' +
                ", userid=" + userid +
                '}';
    }
}

