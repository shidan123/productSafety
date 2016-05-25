package com.tarena.netctoss.web.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.netctoss.entity.Privilege;
import com.tarena.netctoss.entity.Role;
import com.tarena.netctoss.entity.page.Page;
import com.tarena.netctoss.entity.page.RolePage;
import com.tarena.netctoss.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource(name="roleService")
	private RoleService roleService;
	 
	
	@RequestMapping("/findByPage.do")
	public String findByPage(RolePage page,Model model){
		List<Role> roles =  roleService.findByPage(page);
		int rows = roleService.findRows(page);
		page.setRows(rows);
		List<Integer> lists = roleService.getShowPage(page);
		model.addAttribute("lists", lists);
		model.addAttribute("roles", roles);
		model.addAttribute("page", page);
		return "role/role_list";
	}

	@RequestMapping("/toAdd.do")
	public String toAdd(Model model){
		List<Privilege> privilegeList = roleService.findAllPrivilege();
		model.addAttribute("privilegeList", privilegeList);
		return "role/role_add";
	}
	
	
	@RequestMapping("/addRole.do")
	public String addRole(Role role,Integer[] privilegeIds){
		roleService.addRole(role, privilegeIds);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/deleteRole.do")
	public String deleteRole(Integer id){
		roleService.deleteRole(id);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/toUpdate.do")
	public String toUpdate(Integer id,Model model){
		Role roleInfo = roleService.findById(id);
		List<Privilege> privilegeList = roleService.findAllPrivilege();
		model.addAttribute("privilegeList", privilegeList);
		model.addAttribute("roleInfo", roleInfo);
		return "role/role_modi";
	}
	
	@RequestMapping("/update.do")
	public String update(Role role, Integer[] privilegeIds){
		roleService.update(role, privilegeIds);
		return "redirect:findByPage.do";
	}
	
	@ResponseBody
	@RequestMapping("/isRoleSelected.do")
	public Map<String, Object> isRoleSelected(Integer rid ){
		int flag = roleService.isRoleSelected(rid);
		Map<String, Object> map = new HashMap<String, Object>();
		if(flag==1){
			map.put("flag", 1);
			map.put("msg", "删除错误！该角色被使用，不能删除。");
		}
		return map;
	}
}
