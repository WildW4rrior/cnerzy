package com.pie.config;

import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.function.Function;

import org.springframework.stereotype.Component;

import com.pie.util.Constants;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

@Component
public class JwtTokenUtil implements Serializable {
	private static final long serialVersionUID = 8544329907338151549L;

	public String getUsernameFromToken(String token) {
		return (String) getClaimFromToken(token, claim -> claim.get("user_name"));
	}

	public Date getExpirationDateFromToken(String token) {
		return getClaimFromToken(token, Claims::getExpiration);
	}

	public <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
		final Claims claims = getAllClaimsFromToken(token);
		return claimsResolver.apply(claims);
	}

	private Claims getAllClaimsFromToken(String token) {
		return Jwts.parser().setSigningKey(Constants.SECRET.getBytes(Charset.forName("UTF-8")))
				.parseClaimsJws(token.replace("{", "").replace("}", "")).getBody();
	}

	private Boolean isTokenExpired(String token) {
		final Date expiration = getExpirationDateFromToken(token);
		return expiration.before(new Date());
	}

	public Boolean validateToken(String token, String usernameFromToken) {
		final String username = getUsernameFromToken(token);
		return (username.equals(usernameFromToken) && !isTokenExpired(token));
	}
}
