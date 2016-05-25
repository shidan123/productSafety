package com.tarena.netctoss.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * 拦截用户访问的模块
 *	将访问模块的编号绑定到session中
 */
public class CurrentModuleInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1,
			Object arg2) throws Exception {
		String url = request.getRequestURL().toString();
		//System.out.println(url);
		HttpSession session = request.getSession();
		int currentModule=0;
		if(url.contains("role")){
			 currentModule=1;
		}else if (url.contains("admin")){
			currentModule=2;
		}else if(url.contains("product")){
			currentModule=3;
		}else if(url.contains("account")){
			currentModule=4;
		}else if(url.contains("service")){
			currentModule=5;
		}else if(url.contains("bill")){
			currentModule=6;
		}else if(url.contains("report")){
			currentModule=7;
		}
		session.setAttribute("currentModule", currentModule);
		return true;
	}

}
