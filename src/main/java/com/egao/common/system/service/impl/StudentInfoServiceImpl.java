package com.egao.common.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.egao.common.system.mapper.StudentInfoMapper;
import com.egao.common.system.entity.StudentInfo;
import com.egao.common.system.service.StudentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (Studentinfo)表服务实现类
 *
 * @author makejava
 * @since 2022-10-14 09:25:30
 */
@Service("StudentInfoService")
public class StudentInfoServiceImpl extends ServiceImpl<StudentInfoMapper, StudentInfo> implements StudentInfoService {

    @Autowired
    private StudentInfoMapper studentInfoMapper;

    @Override
    public List<StudentInfo> selectAll() {
        return studentInfoMapper.selectAll();
    }

    @Override
    public StudentInfo getByStudentID(String studentID) {
        return studentInfoMapper.selectByStudentID(studentID);
    }


}

