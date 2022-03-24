package cn.edu.svtcc.servlet;

import cn.edu.svtcc.btl.CartBO;
import cn.edu.svtcc.btl.ProductBO;
import en.edu.svtcc.domain.CartDO;
import en.edu.svtcc.domain.ProductDO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/cart")
public class ServletCars extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取购物车中的数据
        if (req.getSession().getAttribute("UserID")==null){
            resp.sendRedirect("login");
            return;
        }
        String userid=req.getSession().getAttribute("UserID").toString();
        ArrayList carts=CartBO.getAll(userid);
        //请求转发
        req.setAttribute("Carts",carts);
        req.getRequestDispatcher("member/flow.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("action")==null){
            return;
        }
        String action=req.getParameter("action");

        if (action.equals("add")) {
            //1.拿到数
            String productid = req.getParameter("productId");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            ProductDO product = ProductBO.getProductById(productid);
            if (req.getSession().getAttribute("UserID") == null) {
                resp.getWriter().println(0);
                return;
            }
            String userid = req.getSession().getAttribute("UserID").toString();
            //2.将数据添加到购物车
            CartBO.add(productid, product.getPrice(), quantity, userid);
            resp.getWriter().println(1);
        }
        else if (action.equals("delete")){
            String productid = req.getParameter("productId");
            String userid = req.getSession().getAttribute("UserID").toString();
            CartBO.delete(productid,userid);
        }
        else {

        }
    }
}
