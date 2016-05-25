package com.tarena.netctoss.dao;

import java.util.List;
import java.util.Map;

import com.tarena.netctoss.annotation.MyAnnotation;
import com.tarena.netctoss.entity.Privilege;
import com.tarena.netctoss.entity.Role;
import com.tarena.netctoss.entity.page.Page;
import com.tarena.netctoss.entity.page.RolePage;
@MyAnnotation
public interface RoleDao {
		
	/**
	 * 分页查询角色
	 * @param adminPage  分页查询条件
	 * @return	返回查询后的角色信息
	 */
	public List<Role> findByPage(RolePage page);
	
	/**
	 * 查询所有查询条件的记录数
	 * @param adminPage
	 * @return
	 */
	public int findRows(Page page);
	
	/**
	 * 查询所有的角色
	 * @return 返回所有的角色
	 */
	public List<Role> findAll();
	
	/**
	 * 添加角色
	 * @param role 角色信息
	 */
	public void addRole(Role role);
	/**
	 * 添加角色相关联的权限
	 * @param param 添加权限的角色id 和权限id
	 */
	public void addRolePrivilege(Map<String, Object> param);
	
	/**
	 * 删除角色
	 */
	public void deleteRole(Integer id);

	/**
	 * 删除角色相关联的角色
	 * @param 角色的id
	 */
	public void deleteRolePrivileges(Integer id);
	
	/**
	 * 根据id查找响应的角色信息
	 * @param id
	 */
	public Role findRole(Integer id);
	 
	/**
	 * 更新角色信息
	 * @param role
	 */
	public void update(Role role);
	
	
	
}
