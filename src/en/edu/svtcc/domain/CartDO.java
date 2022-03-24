package en.edu.svtcc.domain;

import cn.edu.svtcc.btl.ProductBO;

public class CartDO {
    private int id;
    private String productid;
    private double price;
    private int quantity;
    private String userid;
    private ProductDO product;

    public CartDO() {
    }

    public CartDO(int id, String productid, double price, int quantity, String userid) {
        this.id = id;
        this.productid = productid;
        this.price = price;
        this.quantity = quantity;
        this.userid = userid;
        this.product= ProductBO.getProductById(productid);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public ProductDO getProduct() {
        return product;
    }

    @Override
    public String toString() {
        return "CartDO{" +
                "id='" + id + '\'' +
                ", productid='" + productid + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", userid='" + userid + '\'' +
                '}';
    }
}
