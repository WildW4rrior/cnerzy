package com.pie.authentication;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.pie.dao.AccountDAO;
import com.pie.entity.Account;

@Service
public class MyDBAuthenticationService implements UserDetailsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MyDBAuthenticationService.class);
	
	@Autowired
	private AccountDAO accountDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if (username == null || username == "") {
			throw new UsernameNotFoundException("Please fill username");
		}
		String[] parts = username.split(":");
		String email = parts[0];
		String type = parts[1];
		Account account = accountDAO.getAccountBasedOnEmailIdAndRole(email,type);
		LOGGER.debug("Account= {}", account);

		if (account == null || account.getIsDeleted()!=null && account.getIsDeleted()) {
			throw new BadCredentialsException("Invalid Username Or Password");
		}
		// EMPLOYEE,MANAGER,..
		String role = account.getUserRole();
		if(!role.equalsIgnoreCase(type)) {
			throw new BadCredentialsException("Invalid Username Or Password");
		}

		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();

		// ROLE_EMPLOYEE, ROLE_MANAGER
		GrantedAuthority authority = new SimpleGrantedAuthority(role);
		grantList.add(authority);

		boolean enabled = account.isEmailVerified();
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		UserDetails userDetails = (UserDetails) new User(account.getUserName(), account.getPassword(), enabled,
				accountNonExpired, credentialsNonExpired, accountNonLocked, grantList);
		LOGGER.info("UserDetails= {}", userDetails);

		return userDetails;
	}	
}