package com.tarena.netctoss.dao;

import java.util.List;
import java.util.Map;

import com.tarena.netctoss.annotation.MyAnnotation;
import com.tarena.netctoss.entity.Product;
import com.tarena.netctoss.entity.page.ProdPage;

@MyAnnotation
public interface ProductDao {
	
	/**
	 * 根据条形码（产品id）查询产品信息
	 * @param product_id 管产品id
	 * @return	product_info 产品信息
	 */
	public Product findByProductId(String product_id);
	
	
	/**
	 * 	根据动态条件分页查询管理员权限
	 * @param prodPage	分页查询条件
	 * @return List<Product> 分页查询后的产品信息
	 */
	public List<Product> findByPage(ProdPage prodPage);
	
	/**
	 * 查询所有记录数
	 * @return 返回所有记录数
	 */
	public int findRows(ProdPage prodPage);
	
	public List<Integer> getShowPage(ProdPage prodPage);
	/**
	 * 删除产品
	 * @param id 用户的id
	 */
	public void deleteProd(Integer id);
	
	/**
	 * 新增产品
	 */
	public void saveProduct(Product product);
	
	//给产品添加营养成分
	public void saveProdNutrients(Map<String, Object> param);
	
	//根据id查询产品
	public Product findById(int id);
	
	//更新产品信息
	public void update(Product product);
}