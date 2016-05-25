package com.tarena.netctoss.service;

import java.util.List;

import com.tarena.netctoss.entity.Privilege;
import com.tarena.netctoss.entity.Role;
import com.tarena.netctoss.entity.page.AdminPage;
import com.tarena.netctoss.entity.page.Page;
import com.tarena.netctoss.entity.page.RolePage;

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
