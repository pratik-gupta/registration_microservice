package com.pratik.ms.base;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Configuration class for providing the configurations.
 * @author pratikgupta
 *
 */
@Configuration 
@ComponentScan("com.pratik") 

public class AppConfig extends WebMvcConfigurerAdapter {

            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                // forward requests to /admin and /user to their index.html
                registry.addViewController("/registration/login").setViewName("forward:/index.html");
                
            }
}

