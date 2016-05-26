package com.shidan.product.service;

import java.util.List;

import com.shidan.product.entity.Navigation;
import com.shidan.product.entity.Product;
import com.shidan.product.entity.page.NavigationPage;
import com.shidan.product.entity.page.ProdPage;


public interface NavigationService {
	
	
	public List<Navigation> findByPage(NavigationPage navigationPage);
	
	public int findRows(NavigationPage navigationPage);
	
	public List<Integer> getShowPage(NavigationPage navigationPage);
	
	public void deleteNavigation(Integer id);
	
	public void saveNavigation(Navigation navigation);
	
	public Navigation findById(String id);
	
	public void update(Navigation navigation);
}

