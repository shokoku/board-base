package kr.sanus.base1.controller;

import kr.sanus.base1.entity.User;
import kr.sanus.base1.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    @GetMapping("/join")
    public String joinForm(Model model) {
        model.addAttribute("user", new User());
        return "user/joinForm";
    }

    @PostMapping("/join")
    public String join(@ModelAttribute("user") User user) {
        userService.join(user);
        System.out.println("user = " + user);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginForm(Model model) {
        model.addAttribute("user", new User());
        return "user/loginForm";
    }

    @PostMapping("/login")
    public String login(@RequestParam String id,
                        @RequestParam String pw,
                        HttpSession session) {
        boolean isAuthenticated = userService.login(id, pw, session);
        return isAuthenticated ? "redirect:/" : "user/loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/{id}")
    public String info(@PathVariable String id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "user/info";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable String id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "user/editForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@ModelAttribute User user) {
        userService.update(user);
        return "redirect:/";
    }

}
