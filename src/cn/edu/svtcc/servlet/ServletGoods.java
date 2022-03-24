package cn.edu.svtcc.servlet;

import cn.edu.svtcc.btl.ProductBO;
import en.edu.svtcc.domain.ProductDO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/goods")
public class ServletGoods extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.接收productId
        if (req.getParameter("productId")==null){
            resp.getWriter().println("出错啦！");
        }
        String productId=(req.getParameter("productId"));
        //2.根据产品编号获取产品信息
        ProductDO product= ProductBO.getProductById(productId);
        //3.
        req.setAttribute("Product",product);
        req.getRequestDispatcher("goods.jsp").forward(req,resp);
    }
}
