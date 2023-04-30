package com.egao.common.system.entity;


import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;

/**
 * (Studentinfo)表实体类
 *
 * @author makejava
 * @since 2022-10-14 09:25:27
 */
@TableName("studentinfo")
public class StudentInfo implements Serializable {

    //序号
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    //学生编号
    @TableField(value = "studentNo")
    private String studentNo;
    //学生姓名
    @TableField(value = "studentName")
    private String studentName;
    //学生性别

    @TableField(value = "studentSex")
    private Character studentSex;
    //学生专业
    @TableField(value = "studentSkill")
    private String studentSkill;
    //学生爱好
    @TableField(value = "studentLoves")
    private String studentLoves;
    //学生出生日期
    @TableField(value = "studentBornDate")
    private Date studentBornDate;

    @TableLogic
    @TableField(value = "isDeleted")
    private Integer isDeleted;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Character getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(Character studentSex) {
        this.studentSex = studentSex;
    }

    public String getStudentSkill() {
        return studentSkill;
    }

    public void setStudentSkill(String studentSkill) {
        this.studentSkill = studentSkill;
    }

    public String getStudentLoves() {
        return studentLoves;
    }

    public void setStudentLoves(String studentLoves) {
        this.studentLoves = studentLoves;
    }

    public Date getStudentBornDate() {
        return studentBornDate;
    }

    public void setStudentBornDate(Date studentBornDate) {
        this.studentBornDate = studentBornDate;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public StudentInfo() {
    }

    public StudentInfo(Integer id, String studentNo, String studentName, Character studentSex, String studentSkill, String studentLoves, Date studentBornDate, Integer isDeleted) {
        this.id = id;
        this.studentNo = studentNo;
        this.studentName = studentName;
        this.studentSex = studentSex;
        this.studentSkill = studentSkill;
        this.studentLoves = studentLoves;
        this.studentBornDate = studentBornDate;
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "StudentInfo{" +
                "id=" + id +
                ", studentNo='" + studentNo + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentSex=" + studentSex +
                ", studentSkill='" + studentSkill + '\'' +
                ", studentLoves='" + studentLoves + '\'' +
                ", studentBornDate=" + studentBornDate +
                ", isDeleted=" + isDeleted +
                '}';
    }
}



