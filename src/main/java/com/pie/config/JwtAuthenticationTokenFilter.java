package com.pie.config;

import static com.pie.util.Constants.SESSION_C_ID;
import static com.pie.util.Constants.SESSION_USER_NAME;
import static com.pie.util.Constants.SESSION_USER_ROLE;
import static com.pie.util.Constants.SESSION_USER_ID;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.pie.authentication.MyDBAuthenticationService;
import com.pie.dao.AccountDAO;
import com.pie.entity.Account;

@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

	@Autowired
	private JwtTokenUtil jwtTokenUtil;

	@Autowired
	private MyDBAuthenticationService userDetailService;

	@Autowired
	private AccountDAO accountDAO;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		final String header = request.getHeader("Authorization");

		if (header != null && (header.startsWith("Bearer ") || header.startsWith("bearer "))) {
			try {
				String authToken = header.substring(7);
				String username = jwtTokenUtil.getUsernameFromToken(authToken);
				if (username != null) {
					if (jwtTokenUtil.validateToken(authToken, username)) {
						UserDetails userDetails = userDetailService.loadUserByUsername(username);
						UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
								userDetails, null, userDetails.getAuthorities());
						authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
						SecurityContextHolder.getContext().setAuthentication(authentication);
						setUsernameInSession(request, username);
					} else {
						response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
						return;
					}
				}
			} catch (Exception e) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
		}
		chain.doFilter(request, response);
	}

	private void setUsernameInSession(HttpServletRequest request, String username) {
		HttpSession httpSession = request.getSession(false);
		httpSession.setAttribute(SESSION_USER_NAME, username);		
		Account account = accountDAO.findAccount(username);
		httpSession.setAttribute(SESSION_USER_ID, account !=null ? account.getUserId():null);
//		httpSession.setAttribute(SESSION_C_ID, account.getCompany() != null ? account.getCompany().getCompanyId() : null);
		httpSession.setAttribute(SESSION_USER_ROLE, account.getUserRole());

	}
}
