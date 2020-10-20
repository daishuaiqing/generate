package com.daishuaiqing.generate;

import com.daishuaiqing.generate.service.GenerateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class MainBusiEntry implements CommandLineRunner {

    @Autowired
    GenerateService generateService;

    @Override
    public void run(String... args) throws Exception {
        generateService.GenerateCode("oms_order_demo");
    }


}
