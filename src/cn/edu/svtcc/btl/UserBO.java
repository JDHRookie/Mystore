package cn.edu.svtcc.btl;

import en.edu.svtcc.domain.UserDO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserBO {
    public static boolean changePassword(int userId,String newPassword){
        //1.加载驱动
        //2.创建Connection
        //3.编写SQl语句
        //4.创建Statement对象
        //5.执行,得到的是影响的行数
        //6.
        Connection con=null;
        Statement stmt=null;
        try{
            //2.到数据库中去比对有没有对应的账号和密码
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/mystore?serverTimezone=Asia/Shanghai";
            String dbUserName="root";
            String dbPassword="123456";
            con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            stmt=con.createStatement();
            String sql="update users set password='%s' where id=%d";
            sql=String.format(sql,newPassword,userId);
            int r=stmt.executeUpdate(sql);
            if (r>0)
                return true;
            else
                return false;

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if(stmt!=null) stmt.close();
                if (con!=null) con.close();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

    public static boolean updateInfo(int userId,String gender,String realname){
        Connection con=null;
        Statement stmt=null;
        try{
            //2.到数据库中去比对有没有对应的账号和密码
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/mystore?serverTimezone=Asia/Shanghai";
            String dbUserName="root";
            String dbPassword="123456";
            con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            stmt=con.createStatement();
            String sql="update users set realname='%s',gender='%s',where id=%d";
            sql=String.format(sql,realname,gender,userId);
            int r=stmt.executeUpdate(sql);
            if (r>0)
                return true;
            else
                return false;

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if(stmt!=null) stmt.close();
                if (con!=null) con.close();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

    public static UserDO getById(int id){

        return null;
    }
}
