package com.egao.common.system.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
/**
 *  设备基本信息
 * */
@TableName("cms_equipment_info")
public class EquipmentInfo implements Serializable {
    /**
     * 主键id
     * */
    //@TableId(value = "id", type = IdType.AUTO)
    private String id;
    /**
     * 设备编号
     * */
    private String equipmentNumber;
    /**
     * 设备名称
     * */
    private String equipmentName;
    /**
     * 设备轴数
     * */
    private Integer alxeNumber;
    /**
     * 制造商
     * */
    /*@TableField(value = "manu_facturer")*/
    private String manuFacturer;
    /**
     * 创建者
     * */
    private String createBy;
    /**
     * 创建时间
     * */
    private Date createTime;
    /**
     * 修改者
     * */
    private String updateBy;
    /**
     * 修改时间
     * */
    private Date updateTime;
    /**
     * 逻辑删除 1是 0否
     * */
    @TableLogic
    private Integer deleted;

    public String getId() {
        return id;
    }

    public String getEquipmentNumber() {
        return equipmentNumber;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public Integer getAlxeNumber() {
        return alxeNumber;
    }

    public String getManuFacturer() {
        return manuFacturer;
    }

    public String getCreateBy() {
        return createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setEquipmentNumber(String equipmentNumber) {
        this.equipmentNumber = equipmentNumber;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public void setAlxeNumber(Integer alxeNumber) {
        this.alxeNumber = alxeNumber;
    }

    public void setManuFacturer(String manuFacturer) {
        this.manuFacturer = manuFacturer;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public EquipmentInfo(){};

    public EquipmentInfo(String id, String equipmentNumber, String equipmentName, Integer alxeNumber, String manuFacturer, String createBy, Date createTime, String updateBy, Date updateTime, Integer deleted) {
        this.id = id;
        this.equipmentNumber = equipmentNumber;
        this.equipmentName = equipmentName;
        this.alxeNumber = alxeNumber;
        this.manuFacturer = manuFacturer;
        this.createBy = createBy;
        this.createTime = createTime;
        this.updateBy = updateBy;
        this.updateTime = updateTime;
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "EquipmentInfo{" +
                "id='" + id + '\'' +
                ", equipmentNumber='" + equipmentNumber + '\'' +
                ", equipmentName='" + equipmentName + '\'' +
                ", alxeNumber=" + alxeNumber +
                ", manuFacturer='" + manuFacturer + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createTime=" + createTime +
                ", updateBy='" + updateBy + '\'' +
                ", updateTime=" + updateTime +
                ", deleted=" + deleted +
                '}';
    }
}
