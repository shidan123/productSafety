package com.shidan.product.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shidan.product.dao.AdminDao;
import com.shidan.product.dao.RoleDao;
import com.shidan.product.entity.Admin;
import com.shidan.product.entity.Privilege;
import com.shidan.product.entity.Role;
import com.shidan.product.entity.page.AdminPage;
import com.shidan.product.entity.page.RolePage;
import com.shidan.product.service.AdminService;
@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Resource(name="roleDao")
	private RoleDao roleDao;
	
	@Override
	public Admin login(String admin_code) {
		return adminDao.findByAdminCode(admin_code);
	}

	@Override
	public List<Privilege> findPrivilegesByAdminId(Integer adminId) {
		return adminDao.findPrivilegesByAdminId(adminId);
	}

	@Override
	public List<Admin> findByPage(AdminPage adminPage) {

		return adminDao.findByPage(adminPage);
	}

	@Override
	public int findRows(AdminPage adminPage) {
		 
		return adminDao.findRows(adminPage);
		
	}

	@Override
	public List<Integer> getShowPage(AdminPage adminPage) {
		int max =  adminPage.getTotalPage();
		List<Integer> lists = new ArrayList<Integer>();
		int page = adminPage.getCurrentPage();
		if (max <= 5) {
			for (int i = 1; i <= max; i++) {
				lists.add(i);
			}
		}else if(page<=3){
			for (int i =1; i <=5; i++) {
				lists.add(i);
			}
		}else if (page >= 3 && page < (max-2)) {
			for (int i = (page - 2); i <= (page + 2); i++) {
				lists.add(i);
			}
		}else if(page>=(max-2)&&page<=max){
			for(int i=(max-4);i<=max;i++){
				lists.add(i);
			}
		}
		return lists;
	}

	@Override
	public void resetPassword(Integer[] ids) {
		//获取id
		Map<String,Object> parm = new HashMap<String, Object>();
		List<Integer> idList = new ArrayList<Integer>();
		for(Integer id:ids){
			idList.add(id);
		}
		parm.put("password", "123456");
		parm.put("ids", idList);
		adminDao.updatePassword(parm);
		
	}

	@Override
	public void deleteAdmin(Integer id) {
		adminDao.deleteAdminRoles(id);
		adminDao.deleteAdmin(id);
	}

	@Override
	public void saveAdmin(Admin admin, Integer[] roleIds) {
		
		adminDao.saveAdmin(admin);
		for(Integer role_id:roleIds){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("admin_id", admin.getId());
			param.put("role_id", role_id);
			adminDao.saveAdminRoles(param);
		}
		
	}

	@Override
	public Admin findById(Integer id) {
		
		return adminDao.findById(id);
	}

	@Override
	public void update(Admin admin,Integer[] roleIds) {
		//更新基本信息
		adminDao.update(admin);
		//更新角色
		//删除之前的角色
		adminDao.deleteAdminRoles(admin.getId());
		//添加更新后的角色
		for(Integer role_id:roleIds){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("admin_id", admin.getId());
			param.put("role_id", role_id);
			adminDao.saveAdminRoles(param);
		}
	}

}
