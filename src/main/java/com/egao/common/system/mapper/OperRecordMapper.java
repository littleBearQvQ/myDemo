package com.egao.common.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.egao.common.core.web.PageParam;
import com.egao.common.system.entity.OperRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 操作日志Mapper接口
 *
 */
public interface OperRecordMapper extends BaseMapper<OperRecord> {

    /**
     * 分页查询
     */
    List<OperRecord> listPage(@Param("page") PageParam<OperRecord> page);

    /**
     * 查询全部
     */
    List<OperRecord> listAll(@Param("page") Map<String, Object> page);

}
