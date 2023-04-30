package com.egao;

import com.egao.common.system.entity.EquipmentInfo;
import com.egao.common.system.entity.StudentInfo;
import com.egao.common.system.entity.User;
import com.egao.common.system.service.impl.EquipmentInfoServiceImpl;
import com.egao.common.system.service.impl.StudentInfoServiceImpl;
import com.egao.common.system.service.impl.UserRoleServiceImpl;
import com.egao.common.system.service.impl.UserServiceImpl;
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

    @Autowired
    private StudentInfoServiceImpl studentInfoService;

    @Autowired
    private UserServiceImpl userService;

    @Test
    public void contextLoads() {

        /*Integer i1 = -128;
        Integer i2 = -128;
        Integer i3 = 128;
        Integer i4 = 128;
        Short i5 = 210;

        System.out.println(i1==i2);
        System.out.println(i3==i4);*/


        /*studentInfoService.list().forEach(infos->{
            logger.info(infos.toString());
        });*/


        /*studentInfoService.selectAll().forEach(infos->{
            logger.info(infos.toString());
        });*/


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

        Date date = new Date("2000-8-9");
        //date.getDate();
        logger.info(date.getDate()+"");

    }

}
