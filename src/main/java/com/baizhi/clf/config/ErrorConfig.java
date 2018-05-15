package com.baizhi.clf.config;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/4/3.
 */
@Configuration
public class ErrorConfig implements ErrorController {

    private static final String ERROR_PATH = "/static";

    @RequestMapping(value=ERROR_PATH)
    public String handleError(){
        return "404";
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }

}
