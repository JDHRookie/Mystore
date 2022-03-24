package cn.edu.svtcc.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/register")
public class ServletResgist extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、接受来自于浏览器的数据
        String userName=null;
        String password=null;
        String password2=null;
        String tel=null;
        String code=req.getParameter("code");

        //设置浏览器解析中文不会出现乱码   设置在输出之前
        resp.setCharacterEncoding("utf-8");
        resp.setHeader("Content-Type","text/html;charset=utf-8");

        //使用req.getParameter()函数，接受的数据有可能是null
        req.setCharacterEncoding("utf-8");
        userName=req.getParameter("username");

//        byte[] bytes=userName.getBytes("ISO-8859-1");//先把userName转换为二进制
//        userName=new String(bytes,"utf-8");//在把userName以UTF-8的新式展示出来
        if (userName==null){
            resp.getWriter().println("用户名为空");
            return;
        }
        password=req.getParameter("password");
        if (password==null){
            resp.getWriter().println("密码为空");
            return;
        }
        password2=req.getParameter("password2");
        if (password2==null){
            resp.getWriter().println("验证密码为空");
            return;
        }
        tel=req.getParameter("tel");
        if (tel==null){
            resp.getWriter().println("电话号码为空");
            return;
        }
        //验证验证码是否与服务器端相同

        //2、检查是否又·重复的用户名
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/mystore?serverTimezone=Asia/Shanghai";
            String dbUsername="root";
            String dbPassword="123456";
             con= DriverManager.getConnection(url,dbUsername,dbPassword);
             stmt=con.createStatement();
            String sql="select *from users Where userName='%s'";
            sql=String.format(sql,userName);
            rs=stmt.executeQuery(sql);

            if (rs!=null &&rs.next()){
                resp.getWriter().println("该用户名已经存在！");
                return;
            }
            String servercode=(String) (req.getSession().getAttribute("code"));
            if (!code.equals(servercode)){
                resp.getWriter().println("请输入正确的验证码！！");
                return;
            }


            sql="INSERT INTO users(userName,password,tel) values('%s','%s','%s')";
            sql=String.format(sql,userName,password2,tel);
            int result=stmt.executeUpdate(sql);
            if (result>0){
                resp.getWriter().println(userName);
                resp.getWriter().println("注册成功！");
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        finally {
            try{
                if (rs!=null) rs.close();
                if (stmt!=null) stmt.close();
                if (con!=null) con.close();

            }catch (Exception ex){
                ex.printStackTrace();
            }
        }

        //3、插入数据

        //4、释放资源

        //5、给浏览器返回结果
    }
}
