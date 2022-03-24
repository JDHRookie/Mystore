package en.edu.svtcc.domain;

import java.util.ArrayList;

public class ProductDO {
    private String productid;
    private String productname;
    private String size;
    private String brand;
    private String style;
    private String category;
    private String color;
    private Double price;
    private String img;
    private ArrayList<String> imgs;

    public ProductDO(){

    }


    public ProductDO(String productid, String productname, String size, String brand, String style, String category,
                     String color,Double price,String img,String imgs) {
        this.productid = productid;
        this.productname = productname;
        this.size = size;
        this.brand = brand;
        this.style = style;
        this.category = category;
        this.color = color;
        this.price=price;
        this.img=img;
        String[] imgsArr=imgs.split(",");
        this.imgs=new ArrayList<String>();
        for (String s : imgsArr) {
            this.imgs.add(s);
        }

    }
    public ProductDO(String productid, String productname, String size, String brand, String style, String category,
                     String color,Double price,String img) {
        this.productid = productid;
        this.productname = productname;
        this.size = size;
        this.brand = brand;
        this.style = style;
        this.category = category;
        this.color = color;
        this.price=price;
        this.img=img;
    }

    public ArrayList<String> getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        String[] imgsArr=imgs.split(",");
        this.imgs=new ArrayList<String>();
        for (String s : imgsArr) {
            this.imgs.add(s);
        }
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
