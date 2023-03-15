package com.bit.spring.controller;

import com.bit.spring.model.UserDTO;
import com.bit.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {
    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    // 로그인
    @PostMapping("auth")
    public String auth(HttpSession session, Model model, UserDTO attempt) {
        UserDTO result = userService.auth(attempt);

        if(result != null) { // 로그인 성공 시
            session.setAttribute("login", result);
            return "redirect:/board/showAll/1";
        } else { // 로그인 실패 시
            model.addAttribute("message", "로그인 정보를 다시 확인해주세요.");
            return "index";
        }
    }
}
