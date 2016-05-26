package com.shidan.product.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shidan.product.dao.NavigationDao;
import com.shidan.product.entity.Navigation;
import com.shidan.product.entity.Product;
import com.shidan.product.entity.page.NavigationPage;
import com.shidan.product.entity.page.ProdPage;
import com.shidan.product.service.NavigationService;
import com.shidan.product.service.ProductService;
@Service("navigationService")
public class NavigationServiceImpl implements NavigationService{
	@Resource(name="navigationDao")
	private NavigationDao navigationDao;


	@Override
	public List<Navigation> findByPage(NavigationPage navigationPage) {
		return navigationDao.findByPage(navigationPage);
	}

	@Override
	public int findRows(NavigationPage navigationPage) {
		return navigationDao.findRows(navigationPage);
	}
	@Override
	public List<Integer> getShowPage(NavigationPage navigationPage) {
		int max =  navigationPage.getTotalPage();
		List<Integer> lists = new ArrayList<Integer>();
		int page = navigationPage.getCurrentPage();
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
			for(int i=(max-4);i<=max;i++){
				lists.add(i);
			}
		}
		return lists;
	}

	@Override
	public void deleteNavigation(Integer id) {
		navigationDao.deleteNavigation(id);
	}

	@Override
	public void saveNavigation(Navigation navigation) {
		navigationDao.saveNavigation(navigation);
	}

	@Override
	public Navigation findById(String id) {
		return navigationDao.findById(id);
	}

	@Override
	public void update(Navigation navigation) {
		//更新产品基本信息
		navigationDao.update(navigation);
	}
	
	
	
	
}
