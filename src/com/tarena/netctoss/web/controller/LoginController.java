package com.tarena.netctoss.web.controller;

import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.netctoss.entity.Admin;
import com.tarena.netctoss.entity.Privilege;
import com.tarena.netctoss.service.AdminService;
import com.tarena.netctoss.util.ImageUtil;

@Controller
@RequestMapping("/login")
public class LoginController {
	private final static int SUCCESS = 0;
	private final static int ADMIN_CODE_ERROR = 1;
	private final static int PASSWORD_CODE_ERROR = 2;
	private final static int IMAGE_CODE_ERROR = 3;

	@Resource(name = "adminService")
	private AdminService adminService;

	@RequestMapping("/toLogin.do")
	public String toLogin() {
		return "main/login";
	}
	
	@RequestMapping("/toNoPower.do")
	public String toNoPower() {
		return "main/nopower";
	}
	
	@RequestMapping("/toIndex.do")
	public String toIndex(){
		return "main/index";
	}
	
	
	@RequestMapping("/createImage.do")
	public void createImage(HttpServletResponse response, HttpSession session)
			throws Exception {
		Map<String, BufferedImage> image = ImageUtil.createImage();
		// 验证码内容
		String code = image.keySet().iterator().next();
		session.setAttribute("code", code);
		// 内存图片
		BufferedImage img = image.get(code);
		// 设置响应的MIME类型
		response.setContentType("image/jpeg");

		OutputStream out = response.getOutputStream();
		ImageIO.write(img, "jpeg", out);
		out.close();
	}

	@ResponseBody
	@RequestMapping("/login.do")
	public Map<String, Integer> login(String admin_code, String password,
			String code,HttpSession session) {
		Map<String, Integer> result = new HashMap<String, Integer>(); 
		String createCode = (String) session.getAttribute("code");
		//验证验证码
		if(!code.equalsIgnoreCase(createCode)){
			result.put("flag", IMAGE_CODE_ERROR);
			return result;
		}
		
		Admin admin = adminService.login(admin_code);
		//验证账号和密码
		if(admin==null){
			result.put("flag", ADMIN_CODE_ERROR);
			return result;
		}else if(!password.equals(admin.getPassword())){
			result.put("flag", PASSWORD_CODE_ERROR);
			return result;
		}else{
			//查询用户的权限
			List<Privilege> privileges = adminService.findPrivilegesByAdminId(admin.getId());
			session.setAttribute("privileges", privileges);
			session.setAttribute("admin", admin);
			result.put("flag", SUCCESS);
			return result;
		}
		
	}

	/*
	 * @RequestMapping("/login.do") public void login(String admin_code, String
	 * password, String code, HttpServletResponse response, HttpSession session)
	 * throws Exception { response.setContentType("text/html;charset=utf-8");
	 * PrintWriter out = response.getWriter(); Admin admin =
	 * adminService.login(admin_code); if(admin==null){
	 * out.print("{\"flag\":"+SUCCESS+"}");
	 * 
	 * }
	 * 
	 * out.close(); }
	 */

}
