package app.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import app.base.service.UserService;

@Controller
public class FirstController {

	@Autowired
	private UserService userService;

	// 首页
	@RequestMapping("/first")
	public String first(Model model) throws Exception {



		return "base/first";
	}

	// 欢迎页面
	@RequestMapping("/welcome")
	public String welcome() {

		return "base/welcome";
	}



}
