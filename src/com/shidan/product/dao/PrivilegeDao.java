package com.shidan.product.dao;

import java.util.List;

import com.shidan.product.annotation.MyAnnotation;
import com.shidan.product.entity.Privilege;

@MyAnnotation
public interface PrivilegeDao {
	
	public List<Privilege> findAll();
}
