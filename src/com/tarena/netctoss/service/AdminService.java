package com.tarena.netctoss.service;

import java.util.List;

import com.tarena.netctoss.entity.Admin;
import com.tarena.netctoss.entity.Privilege;
import com.tarena.netctoss.entity.Role;
import com.tarena.netctoss.entity.page.AdminPage;


public interface AdminService {
	public Admin login(String admin_code);
	
	public List<Privilege> findPrivilegesByAdminId(Integer adminId);
	
	public List<Admin> findByPage(AdminPage adminPage);
	
	public int findRows(AdminPage adminPage);
	
	public List<Integer> getShowPage(AdminPage adminPage);
	
	public void resetPassword(Integer[] ids);
	
	public void deleteAdmin(Integer id);
	
	
	public void saveAdmin(Admin admin,Integer[] roleIds);
	
	public Admin findById(Integer id);
	
	public void update(Admin admin,Integer[] roleIds);
}

