package com.egao.common.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.egao.common.system.mapper.RoleMapper;
import com.egao.common.system.entity.Role;
import com.egao.common.system.service.RoleService;
import org.springframework.stereotype.Service;

/**
 * 角色服务实现类
 *
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
