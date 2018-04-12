package com.sys.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sys.entity.SysUser;

public interface SysUserDao extends MyBaseRepository<SysUser, Long> {
	
	SysUser findByUsername(String user);
	
	Page<SysUser> findByUsernameLike(String user,Pageable pageable);
	
}