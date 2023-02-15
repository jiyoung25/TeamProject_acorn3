package com.team.project.interceptor;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
/*
 * 만들 때 참고한 글 링크
 * https://victorydntmd.tistory.com/m/177
 * https://willseungh0.tistory.com/84
 */
@Retention(RUNTIME)
@Target(METHOD)
public @interface Auth {
	
	Role role() default Role.USER;
	
	// 이와 같이 작성하면 메서드 위에 @Auth(role=Role.ADMIN)과 같이 작성 가능
	public enum Role {ADMIN, SELLER, USER} //관리자, 판매자, 구매자
}
