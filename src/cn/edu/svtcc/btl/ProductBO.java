package cn.edu.svtcc.btl;

import en.edu.svtcc.domain.ProductDO;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class ProductBO {
    public static ProductDO getProductById(String productid){
        try{
            //2.到数据库中去比对有没有对应的账号和密码
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/mystore?serverTimezone=Asia/Shanghai";
            String dbUserName="root";
            String dbPassword="123456";
            Connection con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            Statement stmt=con.createStatement();
            String sql="Select * from products Where productid=%s";
            // System.out.println(sql);
            // sql=String.format(sql.userName,password);
            sql=String.format(sql,productid);

            //执行sql语句
            //ResultSet 可以看成一张表
            ResultSet rs =stmt.executeQuery(sql);
            ProductDO productDO=null;
            if (rs.next()){
                String productname=rs.getString("productname");
                String size=rs.getString("size");
                String brand=rs.getString("brand");
                String style=rs.getString("style");
                String category=rs.getString("category");
                String color=rs.getString("color");
                Double price=rs.getDouble("price");
                String img=rs.getString("img");
                String imgs=rs.getString("imgs");

                productDO =new ProductDO(productid,productname,size,brand,style,category,color,price,img,imgs);
            }
            rs.close();
            stmt.close();
            con.close();

            return productDO;
        }
        catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<ProductDO> getProducts(double minPrice,double maxPrice,int pageIndex,int pageSize){

        String sql="select *from products";
        if (minPrice>0&&maxPrice>0){
            sql=sql+"where price>%f and price<%f";
            sql=String.format(sql,minPrice,maxPrice);
        }
        sql=sql+"limit %d,%d";
        //pageIndex=1 pageSize=10
        sql=String.format(sql,(pageIndex-1)*pageSize,pageSize);
        return null;
    }
    public static ArrayList<ProductDO> getAllProducts(int pageIndex,int pageSize){
        ArrayList<ProductDO> products=new ArrayList<>();
        try{
            ClassLoader loader=ProductBO.class.getClassLoader();
            InputStream in=loader.getResourceAsStream("db.properties");
            Properties pop=new Properties();
            pop.load(in);
            String driver=pop.getProperty("driver");
            String url=pop.getProperty("url");
            String dbUserName=pop.getProperty("username");
            String dbPassword=pop.getProperty("password");
            System.out.println(pop.getProperty("driver"));
            //2.到数据库中去比对有没有对应的账号和密码
            Class.forName(driver);
            Connection con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            Statement stmt=con.createStatement();
            String sql="Select * from products limit %d,%d";
            // System.out.println(sql);
            // sql=String.format(sql.userName,password);
            sql=String.format(sql,(pageIndex-1)*pageSize,pageSize);

            //执行sql语句
            //ResultSet 可以看成一张表
            ResultSet rs =stmt.executeQuery(sql);
            ProductDO productDO=null;
            while (rs.next()){
                String productid=rs.getString("productid");
                String productname=rs.getString("productname");
                String size=rs.getString("size");
                String brand=rs.getString("brand");
                String style=rs.getString("style");
                String category=rs.getString("category");
                String color=rs.getString("color");
                Double price=rs.getDouble("price");
                String img=rs.getString("img");
                String imgs=rs.getString("imgs");

                productDO =new ProductDO(productid,productname,size,brand,style,category,color,price,img,imgs);
                products.add(productDO);
            }
            rs.close();
            stmt.close();
            con.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return products;
    }
    public static int getAllProductsPageCount(int pageSize){
        int count=0;
        try{
            ClassLoader loader=ProductBO.class.getClassLoader();
            InputStream in=loader.getResourceAsStream("db.properties");
            Properties pop=new Properties();
            pop.load(in);
            String driver=pop.getProperty("driver");
            String url=pop.getProperty("url");
            String dbUserName=pop.getProperty("username");
            String dbPassword=pop.getProperty("password");
            //2.到数据库中去比对有没有对应的账号和密码
            Class.forName(driver);
            Connection con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            Statement stmt=con.createStatement();
            String sql="Select count(*) from products";


            //执行sql语句
            //ResultSet 可以看成一张表
            ResultSet rs =stmt.executeQuery(sql);
            if (rs.next()){
                count=rs.getInt(1);
            }
            rs.close();
            stmt.close();
            con.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        if (count%pageSize==0)
            return count/pageSize;
        else
            return count/pageSize+1;
    }
}
