package com.web.util.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.web.main.controller.Init;
import com.web.member.vo.LoginVO;
import com.web.util.exe.Execute;

/**
 * Servlet Filter implementation class UpdateCondateFilter
 */
//@WebFilter("/UpdateCondateFilter")
public class UpdateCondateFilter extends HttpFilter implements Filter {
       

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public UpdateCondateFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}	
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		System.out.println("UpdateCondateFilter.doFilter()....");
		
		// 로그인을 한 경우 최근 접속일을 수정한다.
		HttpSession session = ((HttpServletRequest)request).getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		String id = null;
		if (loginVO != null) {
			id = loginVO.getId();
			try {
				Execute.execute(Init.get("/member/updateConDate.do"), id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
