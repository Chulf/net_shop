package com.baizhi.clf.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.baizhi.clf.util.ImageCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/code")
public class CodeController {

	// 使用方法
	@RequestMapping("/getCode")
	public void getCode(HttpServletRequest req, HttpServletResponse response,
			HttpSession session) throws IOException {
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		ImageCodeUtil vCode = new ImageCodeUtil(100, 30, 5, 10);
		session.setAttribute("code", vCode.getCode());
		vCode.write(response.getOutputStream());
	}
	@ResponseBody
	@RequestMapping("validateCheck")
	public  String  validateImage(HttpServletRequest request, String  validate){
		String  code = (String) request.getSession().getAttribute("code");
		if(code.equalsIgnoreCase(validate)){
			return "success";
		}else{
			return "error";
		}
	}

}