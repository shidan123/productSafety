package com.tarena.netctoss.dao;

import java.util.List;

import com.tarena.netctoss.annotation.MyAnnotation;
import com.tarena.netctoss.entity.Privilege;

@MyAnnotation
public interface PrivilegeDao {
	
	public List<Privilege> findAll();
}
