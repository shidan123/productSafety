package com.shidan.product.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shidan.product.dao.AdminDao;
import com.shidan.product.dao.PrivilegeDao;
import com.shidan.product.dao.RoleDao;
import com.shidan.product.entity.Privilege;
import com.shidan.product.entity.Role;
import com.shidan.product.entity.page.AdminPage;
import com.shidan.product.entity.page.Page;
import com.shidan.product.entity.page.RolePage;
import com.shidan.product.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	@Resource(name="roleDao")
	private RoleDao roleDao;
	@Resource(name="privilegeDao")
	private PrivilegeDao privilegeDao;
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Override
	public List<Role> findByPage(RolePage page) {
		List<Role> roles = roleDao.findByPage(page);
		return roles;
	}

	@Override
	public int findRows(RolePage page) {
		return roleDao.findRows(page);
	}

	@Override
	public List<Integer> getShowPage(RolePage ppage) {
		int max =  ppage.getTotalPage();
		List<Integer> lists = new ArrayList<Integer>();
		int page = ppage.getCurrentPage();
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
			for(int i=(page - 2);i<=max;i++){
				lists.add(i);
			}
		}
		return lists;
	}

	@Override
	public List<Role> findAll() {
		return roleDao.findAll();
	}

	@Override
	public List<Privilege> findAllPrivilege() {
		return privilegeDao.findAll();
	}

	@Override
	public void addRole(Role role, Integer[] privilegeIds) {
		roleDao.addRole(role);
		for(Integer id:privilegeIds){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("role_id", role.getId());
			param.put("privilege_id", id);
			roleDao.addRolePrivilege(param);
		}
	
	}

	@Override
	public void deleteRole(Integer id) {
		roleDao.deleteRolePrivileges(id);
		roleDao.deleteRole(id);
	}

	@Override
	public Role findById(Integer id) {
		return roleDao.findRole(id);
	}

	@Override
	public void update(Role role, Integer[] privilegeIds) {
		roleDao.update(role);
		roleDao.deleteRolePrivileges(role.getId());
		for(Integer id:privilegeIds){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("role_id", role.getId());
			param.put("privilege_id", id);
			roleDao.addRolePrivilege(param);
		}
	}

	@Override
	public int isRoleSelected(Integer id) {
		List<Integer> ids = adminDao.findAdminIdByRoleId(id);
		System.out.println(ids);
		
		if(ids.isEmpty()){
			return 0;
		}else{
			return 1;
		}
	}
	
	
	
	
}
