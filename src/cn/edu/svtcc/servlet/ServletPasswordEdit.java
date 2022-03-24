package cn.edu.svtcc.servlet;

import cn.edu.svtcc.btl.UserBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/member/password_edit")
public class ServletPasswordEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("password_edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("oldPassword")==null){
            return;
        }

        if (req.getParameter("newPassword1")==null){
            return;
        }

        if (req.getParameter("newPassword2")==null){
            return;
        }
        String server01dbPassword=req.getSession().getAttribute("Password").toString();
        String oldPassword=req.getParameter("oldPassword");
        if (server01dbPassword==null){
            return;
        }
        if (server01dbPassword.equals(oldPassword)){
            //修改密码
            //update users set password='%s' where id=%c=d;
            String newPassword=req.getParameter("newPassword1").toString();
            int userId=(int)req.getSession().getAttribute("UserID");
            if (UserBO.changePassword(userId,newPassword)){
                //告知用户，修改成功
                resp.sendRedirect(req.getContextPath()+"/success.jsp");
            }
            else {
                //如果成功，告知用户
                resp.sendRedirect(req.getContextPath()+"/error.jsp");
            }

        }
        else {
            //原密码错误，告知用户
            resp.sendRedirect(req.getContextPath()+"/error.jsp");
        }
    }
}
