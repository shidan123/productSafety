package com.tarena.netctoss.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tarena.netctoss.entity.Privilege;

public class PrivilegeInterceptor implements HandlerInterceptor{

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
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
		HttpSession session = request.getSession();
		int currentModule = (Integer) session.getAttribute("currentModule");
		List<Privilege> privileges = (List<Privilege>) session.getAttribute("privileges");
		for(Privilege p:privileges){
			if(p.getId()==currentModule){
				return true;
			}
		}
		
		response.sendRedirect(request.getContextPath()+"/login/toNoPower.do");
		
		return false;
	}

}
