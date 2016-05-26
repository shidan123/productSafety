package com.shidan.product.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shidan.product.domain.Message;
import com.shidan.product.entity.Product;
import com.shidan.product.entity.page.ProdPage;
import com.shidan.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Resource(name="productService")
	private ProductService productService;
	
	private void setProductService(ProductService productService) {
		this.productService = productService;
	}
	

	@RequestMapping("/findByPage.do")
	public String findByPage(ProdPage prodPage,Model model){
		List<Product> productList = productService.findByPage(prodPage);
		int rows = productService.findRows(prodPage);
		prodPage.setRows(rows);
		List<Integer> lists = productService.getShowPage(prodPage);
		model.addAttribute("lists", lists);
		model.addAttribute("productList", productList);
		model.addAttribute("prodPage", prodPage);
		return "product/product_list";
		
	}
	
	
	@ResponseBody
	@RequestMapping("/findByProductId.do")
	public Message findByProductId(String product_id,Model model){
		try {
			productService.findByProductId(product_id);
		} catch (Exception e) {
			e.printStackTrace();
			return new Message("0","没有您要查询的商品，我们会尽快完善信息库！");
		}
		return new Message("1","查询中...");
	}
	
	
	@RequestMapping("/toAdd.do")
	public String toAdd(Model model){
		return "product/product_add";
	}
	 
	@RequestMapping("/addProduct.do")
	public String addProduct(Product product){
		productService.saveProduct(product);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/deleteProduct.do")
	public String deleteProduct(Integer id ){
		productService.deleteProd(id);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/saveProduct.do")
	public String saveProduct(Product product){
		productService.saveProduct(product);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/toUpdate.do")
	public String toUpdate(Integer id,Model model){
		//预修改的产品
		model.addAttribute("product", productService.findById(id));
		return "product/product_modi";
	}

	
	@RequestMapping("/update.do")
	public String update(Product product){
		productService.update(product);
		return "redirect:findByPage.do";
	}
}
