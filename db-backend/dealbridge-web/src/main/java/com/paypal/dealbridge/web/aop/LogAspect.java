package com.paypal.dealbridge.web.aop;

import java.util.Arrays;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.Configuration;

@Aspect
@Configuration
public class LogAspect {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Pointcut("execution(* com.paypal.dealbridge.service..*.*(..))")
	public void logPoint(){}
	
	@Before("logPoint()")
	public void beforeLog(JoinPoint joinPoint) {
		logger.info(String.format("Call %s with arguments: %s", joinPoint.getSignature(), Arrays.toString(joinPoint.getArgs())));
	}
	
	@AfterReturning(returning="ret", pointcut="logPoint()")
	public void afterReturningLog(JoinPoint joinPoint, Object ret) {
		logger.info(String.format("%s returns %s", joinPoint.getSignature(), ret));
	}
	
}
