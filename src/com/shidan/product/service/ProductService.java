package com.shidan.product.service;

import java.util.List;

import com.shidan.product.entity.Product;
import com.shidan.product.entity.page.ProdPage;


public interface ProductService {
	
	
	public List<Product> findByPage(ProdPage prodPage);
	
	public int findRows(ProdPage prodPage);
	
	public List<Integer> getShowPage(ProdPage prodPage);
	
	public void deleteProd(Integer id);
	
	public void saveProduct(Product product);
	
	public Product findById(int id);
	
	public Product findByProductId(String product_id);
	
	public void update(Product product);
}

