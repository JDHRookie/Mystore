package cn.edu.svtcc.btl;

import com.mysql.cj.x.protobuf.MysqlxPrepare;
import en.edu.svtcc.domain.CartDO;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class CartBO {
    public static boolean add(String productid,double price,
                              int quantity,String userid){
        if (exist(productid,userid)){
            update(productid,price,quantity,userid);
        }else {
            insert(productid,price,quantity,userid);
        }
        return true;
    }
    public static ArrayList<CartDO> getAll(String userid){
        ArrayList<CartDO> carts=new ArrayList<>();
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
            String sql="Select * from cars where userid=%s";
            sql=String.format(sql,userid);
            //执行sql语句
            //ResultSet 可以看成一张表
            ResultSet rs =stmt.executeQuery(sql);
            while (rs.next()){
                int id=rs.getInt("id");
                String productid=rs.getString("productid");
                Double price=rs.getDouble("price");
                int quantity=rs.getInt("quantity");

                CartDO Cart=new CartDO(id,productid,price,quantity,userid);
                carts.add(Cart);
            }
            rs.close();
            stmt.close();
            con.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return carts;
    }

    private static boolean exist(String productid,String userid){
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet rs =null;
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
            con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            String sql="Select *from cars where productid=? and userid=?";
            stmt=con.prepareStatement(sql);
            stmt.setString(1,productid);
            stmt.setString(2,userid);


            //执行sql语句
            //ResultSet 可以看成一张表
            rs =stmt.executeQuery();
            if (rs.next()){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if (rs!=null)
                rs.close();
                if (stmt!=null)
                stmt.close();
                if (con!=null)
                con.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return false;
    }
    private static boolean insert(String productid,double price,
                                 int quantity,String userid){
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet rs =null;
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
            con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            String sql="insert cars (productid,price,quantity,userid) values (?,?,?,?)";
            stmt=con.prepareStatement(sql);
            stmt.setString(1,productid);
            stmt.setInt(3,quantity);
            stmt.setDouble(2,price);
            stmt.setString(4,userid);


            //执行sql语句
            //ResultSet 可以看成一张表
            int r=stmt.executeUpdate();
            if (r>0){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if (rs!=null)
                    rs.close();
                if (stmt!=null)
                    stmt.close();
                if (con!=null)
                    con.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return false;
    }
    private static boolean update(String productid,double price,
                                 int quantity,String userid){
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet rs =null;
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
            con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            String sql="UPDATE cars set price=?,quantity=quantity+? where productid=? and userid=?";
            stmt=con.prepareStatement(sql);
            stmt.setDouble(1,price);
            stmt.setInt(2,quantity);
            stmt.setString(3,productid);
            stmt.setString(4,userid);


            //执行sql语句
            //ResultSet 可以看成一张表
            int r=stmt.executeUpdate();
            if (r>0){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if (rs!=null)
                    rs.close();
                if (stmt!=null)
                    stmt.close();
                if (con!=null)
                    con.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return false;
    }
    public static boolean delete(String productid,String userid){
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet rs =null;
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
            con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            String sql="delete from cars where productid=? and userid=?";
            stmt=con.prepareStatement(sql);
            stmt.setString(1,productid);
            stmt.setString(2,userid);


            //执行sql语句
            //ResultSet 可以看成一张表
            int r=stmt.executeUpdate();
            if (r>0){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if (rs!=null)
                    rs.close();
                if (stmt!=null)
                    stmt.close();
                if (con!=null)
                    con.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return false;
    }
}
