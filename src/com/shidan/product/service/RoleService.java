package com.shidan.product.service;

import java.util.List;

import com.shidan.product.entity.Privilege;
import com.shidan.product.entity.Role;
import com.shidan.product.entity.page.AdminPage;
import com.shidan.product.entity.page.Page;
import com.shidan.product.entity.page.RolePage;

public interface RoleService {
	
	public List<Role> findByPage(RolePage page);
	
	public int findRows(RolePage page);

	public List<Integer> getShowPage(RolePage page);
	
	public List<Role> findAll();
	
	public List<Privilege> findAllPrivilege();
	
	public void addRole(Role role,Integer[] privilegeIds);
	
	public void deleteRole(Integer id);
	
	public Role findById(Integer id);
	
	public void update(Role role, Integer[] privilegeIds);
	
	public int isRoleSelected(Integer id);
	
}
