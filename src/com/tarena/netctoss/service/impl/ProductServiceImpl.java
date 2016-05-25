package com.tarena.netctoss.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tarena.netctoss.dao.ProductDao;
import com.tarena.netctoss.entity.Product;
import com.tarena.netctoss.entity.page.AdminPage;
import com.tarena.netctoss.entity.page.ProdPage;
import com.tarena.netctoss.service.ProductService;
@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Resource(name="productDao")
	private ProductDao productDao;


	@Override
	public List<Product> findByPage(ProdPage prodPage) {
		return productDao.findByPage(prodPage);
	}

	@Override
	public int findRows(ProdPage prodPage) {
		return productDao.findRows(prodPage);
	}
	@Override
	public List<Integer> getShowPage(ProdPage prodPage) {
		int max =  prodPage.getTotalPage();
		List<Integer> lists = new ArrayList<Integer>();
		int page = prodPage.getCurrentPage();
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
	public void deleteProd(Integer id) {
		productDao.deleteProd(id);
	}

	@Override
	public void saveProduct(Product product) {
		productDao.saveProduct(product);
	}

	@Override
	public Product findById(int id) {
		return productDao.findById(id);
	}

	@Override
	public Product findByProductId(String product_id) {
		return productDao.findByProductId(product_id);
	}

	
	@Override
	public void update(Product product) {
		//更新产品基本信息
		productDao.update(product);
	}
	
	
	
	
}
