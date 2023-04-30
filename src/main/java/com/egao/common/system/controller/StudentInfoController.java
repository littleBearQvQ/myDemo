package com.egao.common.system.controller;


import com.egao.common.core.annotation.OperLog;
import com.egao.common.core.web.JsonResult;
import com.egao.common.core.web.PageParam;
import com.egao.common.core.web.PageResult;
import com.egao.common.system.entity.StudentInfo;
import com.egao.common.system.service.StudentInfoService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * (Studentinfo)表控制层
 *
 * @author makejava
 * @since 2022-10-14 09:25:25
 */
@Slf4j
@Controller
@RequestMapping("/sys/studentInfo")
public class StudentInfoController {
    /**
     * 服务对象
     */
    @Resource
    private StudentInfoService studentInfoService;


    @RequiresPermissions("sys:studentInfo:view")
    @RequestMapping()
    public String view() {
        return "system/student-info.html";
    }

    /**
     * 分页查询基本学生信息
     */
    @OperLog(value = "基本学生信息管理", desc = "分页查询")
    /*@RequiresPermissions("sys:equipmentInfo:list")*/
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<StudentInfo> page(HttpServletRequest request) {
        PageParam<StudentInfo> pageParam = new PageParam<>(request);
        log.info("查询成功！");
        return new PageResult<>(studentInfoService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
    }

    /**
     * 查询全部基本学生信息
     */
    @OperLog(value = "基本学生信息管理", desc = "查询全部")
    /*@RequiresPermissions("sys:equipmentInfo:list")*/
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        PageParam<StudentInfo> pageParam = new PageParam<>(request);
        log.info("查询成功！");
        return JsonResult.ok().setData(studentInfoService.list(pageParam.getOrderWrapper()));
    }

    /**
     * 根据id查询学生信息
     */
    @OperLog(value = "学生信息管理", desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(String StudentID) {
        log.info("查询成功！");
        return JsonResult.ok().setData(studentInfoService.getByStudentID(StudentID));
    }

    /**
     * 添加基本学生信息
     */
    @OperLog(value = "基本学生信息管理", desc = "添加", param = false, result = true)
    /*@RequiresPermissions("sys:equipmentInfo:save")*/
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(StudentInfo studentInfo) {
        if (studentInfoService.save(studentInfo)) {
            log.info("添加成功！");
            return JsonResult.ok("添加成功");
        }
        log.info("添加失败！");
        return JsonResult.error("添加失败");
    }

    /**
     * 修改基本学生信息
     */
    @OperLog(value = "基本学生信息管理", desc = "修改", param = false, result = true)
    /*@RequiresPermissions("sys:equipmentInfo:update")*/
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(StudentInfo studentInfo) {
        if (studentInfoService.updateById(studentInfo)) {
            log.info("修改成功！");
            return JsonResult.ok("修改成功");
        }
        log.info("修改失败！");
        return JsonResult.error("修改失败");
    }

    /**
     * 删除基本学生信息
     */
    @OperLog(value = "基本学生信息管理", desc = "删除", result = true)
    /*@RequiresPermissions("sys:equipmentInfo:remove")*/
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(String id) {
        if (studentInfoService.removeById(id)) {
            log.info("删除成功！");
            return JsonResult.ok("删除成功");
        }
        log.info("删除失败！id:{0}",id);
        return JsonResult.error("删除失败");
    }

    /**
     * 批量添加基本学生信息
     */
    @OperLog(value = "基本学生信息管理", desc = "批量添加", param = false, result = true)
    /*@RequiresPermissions("sys:equipmentInfo:saveBatch")*/
    @ResponseBody
    @RequestMapping("/saveBatch")
    public synchronized JsonResult saveBatch(@RequestBody List<StudentInfo> list) {
        if (studentInfoService.saveBatch(list)) {
            log.info("批量添加成功！");
            return JsonResult.ok("添加成功");
        }
        log.info("批量添加失败！");
        return JsonResult.error("添加失败");
    }

    /**
     * 批量删除基本学生信息
     */
    @OperLog(value = "基本学生信息管理", desc = "批量删除", result = true)
    /*@RequiresPermissions("sys:equipmentInfo:removeBatch")*/
    @ResponseBody
    @RequestMapping("/removeBatch")
    public synchronized JsonResult removeBatch(@RequestBody List<String> ids) {
        if (studentInfoService.removeByIds(ids)) {
            log.info("批量删除成功！");
            return JsonResult.ok("删除成功");
        }
        log.info("批量删除失败！");
        return JsonResult.error("删除失败");
    }






}

