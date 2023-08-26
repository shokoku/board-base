package kr.sanus.base1.controller;

import kr.sanus.base1.exception.DuplicateUserIdException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(DuplicateUserIdException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ModelAndView handleDuplicateUserIdException(DuplicateUserIdException ex) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("error/duplicateUserId");
        modelAndView.addObject("message", "중복된 아이디 입니다.");
        return modelAndView;
    }
}
