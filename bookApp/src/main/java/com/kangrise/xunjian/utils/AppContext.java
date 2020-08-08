package com.kangrise.xunjian.utils;
 
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
 
public class AppContext implements ApplicationContextAware {
 
    private static ApplicationContext applicationContext; // Spring应用上下文环境
 
    // 下面的这个方法上加了@Override注解，原因是继承ApplicationContextAware接口是必须实现的方法
    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        AppContext.applicationContext = applicationContext;
    }
 
    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }
 
    public static Object getBean(String name) throws BeansException {
        return applicationContext.getBean(name);
    }
 
    @SuppressWarnings("unchecked")
	public static Object getBean(String name, @SuppressWarnings("rawtypes") Class requiredType)
            throws BeansException {
        return applicationContext.getBean(name, requiredType);
    }
 
    public static <T> T getBean(Class<T> clazz) throws BeansException {
        return applicationContext.getBean(clazz);
    }
    
    public static boolean containsBean(String name) {
        return applicationContext.containsBean(name);
    }
 
    public static boolean isSingleton(String name) throws NoSuchBeanDefinitionException {
        return applicationContext.isSingleton(name);
    }
 
    @SuppressWarnings("rawtypes")
	public static Class getType(String name)    throws NoSuchBeanDefinitionException {
        return applicationContext.getType(name);
    }
 
    public static String[] getAliases(String name) throws NoSuchBeanDefinitionException {
        return applicationContext.getAliases(name);
    }
}