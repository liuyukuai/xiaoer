package com.itxiaoer.service.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.itxiaoer.service.UserService;

@Component
public class UserAuthorizer implements UserDetailsService {

	@Autowired
	private UserService userService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// 得到登录用户对象
		com.itxiaoer.core.dal.entity.User user = this.userService.loadByName(username);
		if (user == null) {
			return null;
		}
		// 用户权限集合
		Collection<GrantedAuthority> grantedAuthority = this.getGrantedAuthority(user);
		User userdetail = new User(user.getNickName(), user.getPassword(), true, true, true, true, grantedAuthority);
		return userdetail;
	}

	// 获取用户角色，授予权限
	private Set<GrantedAuthority> getGrantedAuthority(com.itxiaoer.core.dal.entity.User user) {
		Set<GrantedAuthority> grantedAuthority = new HashSet<GrantedAuthority>();
		grantedAuthority.add(new SimpleGrantedAuthority(user.getRole()));
		return grantedAuthority;
	}
}
