package cn.edu.svtcc.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Filter01 implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest) servletRequest;
        HttpServletResponse resp=(HttpServletResponse) servletResponse;
        System.out.println("001");
        if (req.getSession().getAttribute("UserID")==null){
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }
        filterChain.doFilter(req,resp);
    }

    @Override
    public void destroy() {

    }
}
