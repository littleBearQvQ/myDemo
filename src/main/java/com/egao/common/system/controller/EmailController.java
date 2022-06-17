package com.egao.common.system.controller;

import com.egao.common.core.annotation.OperLog;
import com.egao.common.core.web.JsonResult;
import com.egao.common.system.service.EmailService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;

/**
 * 邮件功能
 *
 */
@Controller
@RequestMapping("/sys/email")
public class EmailController {
    @Autowired
    private EmailService emailService;

    @RequiresPermissions("sys:email:view")
    @RequestMapping()
    public String view() {
        return "system/email.html";
    }

    /**
     * 发送邮件
     */
    @OperLog(value = "邮件功能", desc = "发送邮件", result = true, param = false)
    @RequiresPermissions("sys:email:view")
    @ResponseBody
    @RequestMapping("/send")
    public JsonResult send(String title, String html, String email) {
        try {
            emailService.sendFullTextEmail(title, html, new String[]{email});
            return JsonResult.ok("发送成功");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return JsonResult.error("发送失败");
    }

}
