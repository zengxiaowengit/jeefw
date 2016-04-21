package com.jeefw.service.sys;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import com.jeefw.model.sys.Authority;

import core.service.Service;

/**
 * 菜单的业务逻辑层的接口
 */
public interface AuthorityService extends Service<Authority> {

	// 只有角色编码是ROLE_ADMIN、ROLE_RESTRICTED_ADMIN和ROLE_USER才可以访问此方法
	// 获取一级菜单和二次菜单
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_RESTRICTED_ADMIN') or hasRole('ROLE_USER')")
	List<Authority> queryAllMenuList(String globalRoleKey, List<Authority> mainMenuList);

}
