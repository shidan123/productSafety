package com.shidan.product.dao;

import java.util.List;
import java.util.Map;

import com.shidan.product.annotation.MyAnnotation;
import com.shidan.product.entity.Navigation;
import com.shidan.product.entity.Product;
import com.shidan.product.entity.page.NavigationPage;
import com.shidan.product.entity.page.ProdPage;

@MyAnnotation
public interface NavigationDao {
	
	/**
	 * 根据导航id查询导航信息
	 * @param id 导航id
	 * @return	navigation 导航信息
	 */
	public Navigation findById(String id);
	
	
	/**
	 * 	根据动态条件分页查询导航信息
	 * @param NavigationPage	分页查询条件
	 * @return List<Navigation> 分页查询后的导航信息
	 */
	public List<Navigation> findByPage(NavigationPage prodPage);
	
	/**
	 * 查询所有记录数
	 * @return 返回所有记录数
	 */
	public int findRows(NavigationPage navigationPage);
	
	public List<Integer> getShowPage(NavigationPage navigationPage);
	/**
	 * 删除导航信息
	 * @param id 用户的id
	 */
	public void deleteNavigation(Integer id);
	
	/**
	 * 新增导航信息
	 */
	public void saveNavigation(Navigation navigation);
	
	//更新导航信息
	public void update(Navigation navigation);
}