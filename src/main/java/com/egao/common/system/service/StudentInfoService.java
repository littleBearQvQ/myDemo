package com.egao.common.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.egao.common.system.entity.StudentInfo;

import java.util.List;

/**
 * (Studentinfo)表服务接口
 *
 * @author makejava
 * @since 2022-10-14 09:25:30
 */
public interface StudentInfoService extends IService<StudentInfo> {

    List<StudentInfo> selectAll();

    StudentInfo getByStudentID(String studentID);

}

