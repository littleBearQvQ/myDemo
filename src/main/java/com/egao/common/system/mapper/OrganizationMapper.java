package com.egao.common.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.egao.common.core.web.PageParam;
import com.egao.common.system.entity.Organization;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 组织机构Mapper接口
 *
 */
public interface OrganizationMapper extends BaseMapper<Organization> {

    /**
     * 分页查询
     */
    List<Organization> listPage(@Param("page") PageParam<Organization> page);

    /**
     * 查询全部
     */
    List<Organization> listAll(@Param("page") Map<String, Object> page);

}
