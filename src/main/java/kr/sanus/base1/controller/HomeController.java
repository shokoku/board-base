package kr.sanus.base1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final TestDataGenerator testDataGenerator;

    @Autowired
    public HomeController(TestDataGenerator testDataGenerator) {
        this.testDataGenerator = testDataGenerator;
    }


    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/test")
    public String generateTestData() {
        testDataGenerator.generateAndSaveBoardDTOs(100);
        return "redirect:/";
    }



}
