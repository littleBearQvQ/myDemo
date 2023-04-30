package com.egao.common.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.egao.common.system.entity.StudentInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (Studentinfo)表数据库访问层
 *
 * @author makejava
 * @since 2022-10-14 09:25:26
 */
public interface StudentInfoMapper extends BaseMapper<StudentInfo> {

    List<StudentInfo> selectAll();

    StudentInfo selectByStudentID(@Param("studentID") String studentID);
}

