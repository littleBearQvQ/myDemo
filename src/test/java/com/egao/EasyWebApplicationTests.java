package com.egao;

import com.egao.common.system.entity.EquipmentInfo;
import com.egao.common.system.service.impl.EquipmentInfoServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class EasyWebApplicationTests {

    private static final Logger logger = LoggerFactory.getLogger(EasyWebApplicationTests.class);

    @Autowired
    private EquipmentInfoServiceImpl equipmentInfoService;

    @Test
    public void contextLoads() {

        /*equipmentInfoService.list().forEach(infos->{
            logger.info(infos.toString());
        });*/

        /*equipmentInfoService.removeById("26603e9fab1ea7a9f9af71bde7734a0d");*/

        /*equipmentInfoService.save(
                new EquipmentInfo("3fd4c1623cd76859affed601219ee4fe","VTC-200BN",
                        "VTC-200BN",5,"",null,new Date(),
                        null,new Date(),0)

        );*/

        /*equipmentInfoService.updateById(new EquipmentInfo("600d7fc93c57d10d0e38ebcc92639b6e", "VTC-200BN",
                "VTC-211BN", 4, "", null, new Date(),
                null, new Date(), 0)
        );*/
    }

}
