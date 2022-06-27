package com.ssafy.happyhouse.config;

import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy
@MapperScan(basePackages = { "com.ssafy.**.mapper" })
public class WebMvcConfiguration implements WebMvcConfigurer {
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**") // 프로그램에서 제공하는 URL
				.allowedOrigins("http://localhost:80") // 청을 허용할 출처를 명시, 전체 허용 (가능하다면 목록을 작성한다.
				.allowedHeaders("*") // 어떤 헤더들을 허용할 것인지
				.allowedMethods("*") // 어떤 메서드를 허용할 것인지 (GET, POST...)
				.allowCredentials(false) // 쿠키 요청을 허용한다(다른 도메인 서버에 인증하는 경우에만 사용해야하며, true 설정시 보안상 이슈가 발생할 수 있다) //
				.maxAge(1500) // preflight 요청에 대한 응답을 브라우저에서 캐싱하는 시간
		;
	}

}
