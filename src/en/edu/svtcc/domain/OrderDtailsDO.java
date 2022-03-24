package en.edu.svtcc.domain;

public class OrderDtailsDO {
    private String orderid;
    private String detailid;
    private String productid;
    private int quantity;
    private Double productprice;
    private ProductDO productDO;

    public OrderDtailsDO(){

    }

    public OrderDtailsDO(String orderid, String detailid, String productid, int quantity, Double productprice) {
        this.orderid = orderid;
        this.detailid = detailid;
        this.productid = productid;
        this.quantity = quantity;
        this.productprice = productprice;
    }

    public OrderDtailsDO(String orderid, String detailid, String productid, int quantity, Double productprice,
                         ProductDO productDO) {
        this.orderid = orderid;
        this.detailid = detailid;
        this.productid = productid;
        this.quantity = quantity;
        this.productprice = productprice;
        this.productDO = productDO;
    }

    public ProductDO getProductDO() {
        return productDO;
    }

    public void setProductDO(ProductDO productDO) {
        this.productDO = productDO;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getDetailid() {
        return detailid;
    }

    public void setDetailid(String detailid) {
        this.detailid = detailid;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getProductprice() {
        return productprice;
    }

    public void setProductprice(Double productprice) {
        this.productprice = productprice;
    }
}
