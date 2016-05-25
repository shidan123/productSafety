package com.tarena.netctoss.dao;

import java.util.List;
import java.util.Map;

import com.tarena.netctoss.annotation.MyAnnotation;
import com.tarena.netctoss.entity.Admin;
import com.tarena.netctoss.entity.Privilege;
import com.tarena.netctoss.entity.page.AdminPage;

@MyAnnotation
public interface AdminDao {
	
	/**
	 * 根据管理员账号查询 用户信息
	 * @param admin_code 管理员账号
	 * @return	Admin 管理员信息
	 */
	public Admin findByAdminCode(String admin_code);
	
	/**
	 * 根据管理员账号查询管理员权限
	 * @param adminId 管理员编号
	 * @return List<Privilege> 管理员所有权限
	 */
	public List<Privilege> findPrivilegesByAdminId(Integer adminId);
	
	/**
	 * 	根据动态条件分页查询管理员权限
	 * @param adminPage	分页查询条件
	 * @return List<Admin> 分页查询后的管理员信息
	 */
	public List<Admin> findByPage(AdminPage adminPage);
	
	/**
	 * 查询所有记录数
	 * @return 返回所有记录数
	 */
	public int findRows(AdminPage adminPage);
	
	
	/**
	 * 重置用户的密码
	 * @param parm 用户id和初始密码
	 */
	public void updatePassword(Map<String,Object> parm);
	
	/**
	 * 删除用户的关联的角色
	 */
	public void deleteAdminRoles(Integer id);
	/**
	 * 删除用户
	 * @param id 用户的id
	 */
	public void deleteAdmin(Integer id);
	
	/**
	 * 创建管理员账号
	 */
	public void saveAdmin(Admin admin);
	
	//授权管理员角色
	public void saveAdminRoles(Map<String, Object> param);
	
	//根据id查询admin
	public Admin findById(int id);
	
	//更新管理员信息
	public void update(Admin admin);
	
	/**
	 * 根据角色id查找对应的管理员id
	 * @param id 
	 * @return
	 */
	public List<Integer> findAdminIdByRoleId(Integer id);
}
