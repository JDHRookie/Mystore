package cn.edu.svtcc.servlet;

import cn.edu.svtcc.btl.ProductBO;
import en.edu.svtcc.domain.OrderDtailsDO;
import en.edu.svtcc.domain.OrdersDO;
import en.edu.svtcc.domain.ProductDO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/member/member")
public class ServletMember extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //1.到数据库中去拿到用户的订单数据

        try{
            //2.到数据库中去比对有没有对应的账号和密码
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/mystore?serverTimezone=Asia/Shanghai";
            String dbUserName="root";
            String dbPassword="123456";
            Connection con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            Statement stmt=con.createStatement();
            //String sql="Select * from users Where UserName='"+userName+"' and Password='"+password+"'";
            String sql="Select * from orders Where userid=%d";
            //System.out.println(sql);
            //从Session中拿到用户的userID
            int userID=(int)req.getSession().getAttribute("UserID");
            sql=String.format(sql,userID);
            //执行sql语句
            //ResultSet 可以看成一张表
            ResultSet rs =stmt.executeQuery(sql);
            //声明一个集合来装所有订单数据
            ArrayList<OrdersDO> orders=new ArrayList<>();
            while ((rs.next())){
                String orderid;
                int quantity;
                double totalprice;
                Date orderdate;
                String receiver;
                String address;
                String tel;
                int userid;
                orderid=rs.getString("orderid");
                quantity=rs.getInt("quantity");
                totalprice=rs.getDouble("totalprice");
                orderdate=rs.getDate("orderdate");
                receiver=rs.getString("receiver");
                address=rs.getString("address");
                tel=rs.getString("tel");
                userid=rs.getInt("userid");

                OrdersDO ordersDO=new OrdersDO(orderid,quantity,totalprice,orderdate,receiver,address,tel,userid,null);
                orders.add(ordersDO);

            }
            rs.close();
            for (OrdersDO order : orders) {
                //根据订单编号获取订单对应的详情
                ArrayList<OrderDtailsDO> details=new ArrayList<>();
                sql="select *from orderitems where orderid=%s";
                sql=String.format(sql,order.getOrderid());
                ResultSet rs2=stmt.executeQuery(sql);
                //System.out.println(rs);
                while (rs2.next()){
                    String orderid=rs2.getString("orderid");
                    String detailid=rs2.getString("detailid");
                    String productid=rs2.getString("productid");
                    int quantity=rs2.getInt("quantity");
                    double productprice=rs2.getDouble("productprice");

                    ProductDO productDO= ProductBO.getProductById(productid);
                    
                    OrderDtailsDO orderDtailsDO=new OrderDtailsDO(orderid,detailid,productid,quantity,productprice);
                    details.add(orderDtailsDO);
                    orderDtailsDO.setProductDO(productDO);


                }
                rs2.close();
                order.setDetails(details);
            }
            stmt.close();
            con.close();
//
//            for (OrdersDO order : orders) {
//                System.out.println(order);//这里相当于调用父类object.toString方法，所以需要在类中重写toString方法
//            }
            req.setAttribute("Orders",orders);
            //请求转发到member.jsp
            req.getRequestDispatcher("member.jsp").forward(req,resp);

        }
        catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();

        }
        //直接从数据库中拿到的数据其实是ReusltSet
        //将ResultSet中的数据转存到集合中
    }
}