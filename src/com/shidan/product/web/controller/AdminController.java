package com.shidan.product.web.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shidan.product.domain.Message;
import com.shidan.product.entity.Admin;
import com.shidan.product.entity.Role;
import com.shidan.product.entity.page.AdminPage;
import com.shidan.product.service.AdminService;
import com.shidan.product.service.RoleService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	@Resource(name="roleService")
	private RoleService roleService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("/findByPage.do")
	public String findByPage(AdminPage adminPage,Model model){
		List<Admin> adminList = adminService.findByPage(adminPage);
		int rows = adminService.findRows(adminPage);
		adminPage.setRows(rows);
		List<Integer> lists = adminService.getShowPage(adminPage);
		model.addAttribute("lists", lists);
		
		model.addAttribute("adminList", adminList);
		model.addAttribute("adminPage", adminPage);
		return "admin/admin_list";
		
	}
	
	@ResponseBody
	@RequestMapping("findByAdminCode.do")
	public Message findByAdminCode(String admin_code){
		Admin admin = new Admin();
		try {
			admin = adminService.login(admin_code);
		} catch (Exception e) {
			e.printStackTrace();
			return new Message("0","您是无权用户，请注册后在登录！");
		}
		return new Message("1","稍等...");
	}
	
	@RequestMapping("/toAdd.do")
	public String toAdd(Model model){
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		return "admin/admin_add";
	}
	 
	@RequestMapping("/addAdmin.do")
	public String addAdmin(Admin admin,Integer[] roleIds){
		adminService.saveAdmin(admin, roleIds);
		return "redirect:findByPage.do";
	}
	
	@ResponseBody
	@RequestMapping("/validateAdminCode.do")
	public Map<String,Integer> validateAdminCode(String adminCode){
		Map<String, Integer> map = new HashMap<String, Integer>();
		//查询用户是否存在
		Admin admin = adminService.login(adminCode);
		if(admin==null){
			//0表示可以添加
			map.put("flag", 0);
		}else{
			//1表示不能添加	
			map.put("flag", 1);
		}
		return map;
	}
	
	
	//密码重置		//ids=1&ids=2&ids=3
	@ResponseBody
	@RequestMapping("/resetPassword.do")
	public Map<String,Object> resetPassword(Integer[] ids){
		//获取id
		System.out.println(Arrays.toString(ids));
		adminService.resetPassword(ids);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "密码重置成功");
		return result;
	}
	
	@RequestMapping("/deleteAdmin.do")
	public String deleteAdmin(Integer id ){
		adminService.deleteAdmin(id);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/saveAdmin.do")
	public String saveAdmin(Admin admin ,Integer[] roleIds){
		adminService.saveAdmin(admin, roleIds);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/toUpdate.do")
	public String toUpdate(Integer id,Model model){
		//所有角色
		model.addAttribute("roleList", roleService.findAll());
		//预修改的Admin
		model.addAttribute("admin", adminService.findById(id));
		return "admin/admin_modi";
	}

	
	@RequestMapping("/update.do")
	public String update(Admin admin ,Integer[] roleIds){
		adminService.update(admin, roleIds);
		return "redirect:findByPage.do";
	}
}
