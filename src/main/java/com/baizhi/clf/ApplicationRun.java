package com.baizhi.clf;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ImportResource;

/**
 * Created by Administrator on 2018/3/21.
 */
@SpringBootApplication
@ServletComponentScan
@MapperScan("com.baizhi.clf.dao")
@ImportResource("classpath:com/baizhi/clf/mvc/spring-mvc.xml")
public class ApplicationRun extends SpringBootServletInitializer{
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        builder.sources(this.getClass());
        return super.configure(builder);
    }

    public static void main(String[] args) {
        SpringApplication.run(ApplicationRun.class,args);
    }
}
