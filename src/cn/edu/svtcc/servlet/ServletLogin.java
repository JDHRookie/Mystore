package cn.edu.svtcc.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.ConnectException;
import java.sql.*;
import java.util.Locale;

@WebServlet("/login")
public class ServletLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies=req.getCookies();
        if (cookies!=null&&cookies.length>0){
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("UserID")){
                    int uerid=Integer.parseInt(cookie.getValue());
                    //根据uerid查询用户相关信息
                    //将用户的信息保存到session中
                    //转发到member页面
//                    req.getSession().setAttribute("UserID",userid);
//                    req.getSession().setAttribute("UserName",userName);
//                    req.getSession().setAttribute("Password",password);
//                    req.getSession().setAttribute("gender",gender);
//                    req.getSession().setAttribute("realname",realname);
//                    req.getSession().setAttribute("email",email);


                    req.getRequestDispatcher("member/member").forward(req,resp);
                }
            }
        }
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        //获取用户是否点击了记住我

        //获取来自浏览器发送的账号密码、验证码
        //1.获取来自于浏览器发送的账号和密码和验证码
        String userName=req.getParameter("username");
        String password=req.getParameter("password");
        String code=req.getParameter("code");


        //1.账号、密码、验证码都不能为空
        if (userName==null||"".equals(userName.trim())){
            //userName.trim()去掉首尾的空格来和空进行比较
            resp.getWriter().println("请输入用户名");
            return;
        }
        if (password==null||"".equals(password.trim())){
            resp.getWriter().println("请输入密码");
            return;
        }
        if (code==null||"".equals(code.trim())){
            resp.getWriter().println("请输入验证码");
            return;
        }
        //判断验证码是否正确
        String serverCode=(String)(req.getSession().getAttribute("code"));

        if (!code.toLowerCase(Locale.ROOT).equals(serverCode.toLowerCase(Locale.ROOT))){
            resp.getWriter().println("请输入正确的验证码");
            return;
        }

        try{
            //2.到数据库中去比对有没有对应的账号和密码
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/mystore?serverTimezone=Asia/Shanghai";
            String dbUserName="root";
            String dbPassword="123456";
            Connection con= DriverManager.getConnection(url,dbUserName,dbPassword);

            //使用stmt对象执行SQL语句
            Statement stmt=con.createStatement();
            String sql="Select * from users Where UserName='"+userName+"' and Password='"+password+"'";
            // System.out.println(sql);
            // sql=String.format(sql.userName,password);

            //执行sql语句
            //ResultSet 可以看成一张表
            ResultSet rs =stmt.executeQuery(sql);
            if (rs.next()){
                String gender=rs.getString("gender");
                String realname=rs.getString("realname");
                String email=rs.getString("email");
                int userid=rs.getInt("id");
                req.getSession().setAttribute("UserID",userid);
                req.getSession().setAttribute("UserName",userName);
                req.getSession().setAttribute("Password",password);
                req.getSession().setAttribute("gender",gender);
                req.getSession().setAttribute("realname",realname);
                req.getSession().setAttribute("email",email);

                //构造一个cookie，再发送给浏览器
                Cookie cookie =new Cookie("UserID",new Integer(userid).toString());
                resp.addCookie(cookie);
                req.getRequestDispatcher("member/member").forward(req,resp);
            }
            else{
                resp.getWriter().println("fail!");
            }
            rs.close();
            stmt.close();
            con.close();
        }
        catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();

        }
        //3.根据数据库返回的数据，来告诉浏览器登录成功还是失败
    }
}