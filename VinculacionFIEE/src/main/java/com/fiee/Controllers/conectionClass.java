package com.fiee.Controllers;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class conectionClass
{
    @Bean
     public DriverManagerDataSource conectar()
    {
        System.gc();
        DriverManagerDataSource ds = new DriverManagerDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/vinculacionfiee?characterEncoding=latin1&useConfigs=maxPerformance");
        ds.setUsername("root");
        ds.setPassword("12345a");

        return ds;
    }
  
}
