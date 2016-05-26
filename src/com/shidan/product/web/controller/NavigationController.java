package com.shidan.product.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shidan.product.domain.Message;
import com.shidan.product.entity.Navigation;
import com.shidan.product.entity.Product;
import com.shidan.product.entity.page.NavigationPage;
import com.shidan.product.service.NavigationService;

@Controller
@RequestMapping("/navigation")
public class NavigationController {
	
	@Resource(name="navigationService")
	private NavigationService navigationService;
	

	public void setNavigationService(NavigationService navigationService) {
		this.navigationService = navigationService;
	}


	@RequestMapping("/findByPage.do")
	public String findByPage(NavigationPage navigationPage,Model model){
		List<Navigation> navigationList = navigationService.findByPage(navigationPage);
		int rows = navigationService.findRows(navigationPage);
		navigationPage.setRows(rows);
		List<Integer> lists = navigationService.getShowPage(navigationPage);
		model.addAttribute("lists", lists);
		model.addAttribute("navigationList", navigationList);
		model.addAttribute("navigationPage", navigationPage);
		return "navigation/navigation_list";
		
	}
	
	
	@ResponseBody
	@RequestMapping("/findById.do")
	public Message findById(String id,Model model){
		try {
			navigationService.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return new Message("0","没有您要查询的商品，我们会尽快完善信息库！");
		}
		return new Message("1","查询中...");
	}
	
	
	@RequestMapping("/toAdd.do")
	public String toAdd(Model model){
		return "navigation/navigation_add";
	}
	 
	@RequestMapping("/addNavigation.do")
	public String addNavigation(Navigation navigation){
		navigationService.saveNavigation(navigation);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/deleteNavigation.do")
	public String deleteNavigation(Integer id ){
		navigationService.deleteNavigation(id);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/saveNavigation.do")
	public String saveNavigation(Navigation navigation){
		navigationService.saveNavigation(navigation);
		return "redirect:findByPage.do";
	}
	
	@RequestMapping("/toUpdate.do")
	public String toUpdate(String id,Model model){
		//预修改的产品
		model.addAttribute("navigation", navigationService.findById(id));
		return "navigation/navigation_modi";
	}

	
	@RequestMapping("/update.do")
	public String update(Navigation navigation){
		navigationService.update(navigation);
		return "redirect:findByPage.do";
	}
}
