package com.egao.common.system.controller;

import com.egao.common.core.annotation.OperLog;
import com.egao.common.core.web.JsonResult;
import com.egao.common.core.web.PageParam;
import com.egao.common.core.web.PageResult;
import com.egao.common.system.entity.EquipmentInfo;
import com.egao.common.system.service.EquipmentInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 基本设备信息管理
 * */
@Controller
@RequestMapping("/sys/equipmentInfo")
@SuppressWarnings("all")
public class EquipmentInfoController {

        private static final Logger logger = LoggerFactory.getLogger(EquipmentInfoController.class);

        @Autowired
        private EquipmentInfoService equipmentInfoService;

        /*@RequiresPermissions("sys:equipmentInfo:view")*/
        @RequestMapping()
        public String view() {
                return "system/equipment-info.html";
        }

        /**
         * 分页查询基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "分页查询")
        /*@RequiresPermissions("sys:equipmentInfo:list")*/
        @ResponseBody
        @RequestMapping("/page")
        public PageResult<EquipmentInfo> page(HttpServletRequest request) {
                        PageParam<EquipmentInfo> pageParam = new PageParam<>(request);
                logger.info("查询成功！");
                return new PageResult<>(equipmentInfoService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
        }

        /**
         * 查询全部基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "查询全部")
        /*@RequiresPermissions("sys:equipmentInfo:list")*/
        @ResponseBody
        @RequestMapping("/list")
        public JsonResult list(HttpServletRequest request) {
                PageParam<EquipmentInfo> pageParam = new PageParam<>(request);
                logger.info("查询成功！");
                return JsonResult.ok().setData(equipmentInfoService.list(pageParam.getOrderWrapper()));
        }

        /**
         * 根据id查询基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "根据id查询")
        /*@RequiresPermissions("sys:equipmentInfo:get")*/
        @ResponseBody
        @RequestMapping("/get")
        public JsonResult get(String id) {
                logger.info("查询成功！");
                return JsonResult.ok().setData(equipmentInfoService.getById(id));
        }

        /**
         * 添加基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "添加", param = false, result = true)
        /*@RequiresPermissions("sys:equipmentInfo:save")*/
        @ResponseBody
        @RequestMapping("/save")
        public JsonResult save(EquipmentInfo equipmentInfo) {
                equipmentInfo.setCreateTime(new Date());
                if (equipmentInfoService.save(equipmentInfo)) {
                        logger.info("添加成功！");
                        return JsonResult.ok("添加成功");
                }
                logger.info("添加失败！");
                return JsonResult.error("添加失败");
        }

        /**
         * 修改基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "修改", param = false, result = true)
        /*@RequiresPermissions("sys:equipmentInfo:update")*/
        @ResponseBody
        @RequestMapping("/update")
        public JsonResult update(EquipmentInfo equipmentInfo) {
                equipmentInfo.setUpdateTime(new Date());
                if (equipmentInfoService.updateById(equipmentInfo)) {
                        logger.info("修改成功！");
                        return JsonResult.ok("修改成功");
                }
                logger.info("修改失败！");
                return JsonResult.error("修改失败");
        }

        /**
         * 删除基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "删除", result = true)
        /*@RequiresPermissions("sys:equipmentInfo:remove")*/
        @ResponseBody
        @RequestMapping("/remove")
        public JsonResult remove(String id) {
                if (equipmentInfoService.removeById(id)) {
                        logger.info("删除成功！");
                        return JsonResult.ok("删除成功");
                }
                logger.info("删除失败！id:{0}",id);
                return JsonResult.error("删除失败");
        }

        /**
         * 批量添加基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "批量添加", param = false, result = true)
        /*@RequiresPermissions("sys:equipmentInfo:saveBatch")*/
        @ResponseBody
        @RequestMapping("/saveBatch")
        public synchronized JsonResult saveBatch(@RequestBody List<EquipmentInfo> list) {
                if (equipmentInfoService.saveBatch(list)) {
                        logger.info("批量添加成功！");
                        return JsonResult.ok("添加成功");
                }
                logger.info("批量添加失败！");
                return JsonResult.error("添加失败");
        }

        /**
         * 批量删除基本设备信息
         */
        @OperLog(value = "基本设备信息管理", desc = "批量删除", result = true)
        /*@RequiresPermissions("sys:equipmentInfo:removeBatch")*/
        @ResponseBody
        @RequestMapping("/removeBatch")
        public synchronized JsonResult removeBatch(@RequestBody List<String> ids) {
                if (equipmentInfoService.removeByIds(ids)) {
                        logger.info("批量删除成功！");
                        return JsonResult.ok("删除成功");
                }
                logger.info("批量删除失败！");
                return JsonResult.error("删除失败");
        }

}
