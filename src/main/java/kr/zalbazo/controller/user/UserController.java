package kr.zalbazo.controller.user;

import kr.zalbazo.model.user.User;
import kr.zalbazo.service.user.UserService;
import kr.zalbazo.validator.UserValidator;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@RequestMapping({"/user/*"})
@Controller
@Log4j
public class UserController {
    @Autowired
    private UserService service;

    @InitBinder
    public void initUserBinder(WebDataBinder webDataBinder){
        webDataBinder.setValidator(new UserValidator(service));
    }

    @GetMapping("/register")
    public String join(Model model) {
        model.addAttribute("user",new User());
        return "user/userjoin";
    }

    @PostMapping("/register")
    public String join(@Valid @ModelAttribute User user, BindingResult bindingResult, RedirectAttributes rttr) {

        if(bindingResult.hasErrors()){
            return "user/userjoin";
        }
        user.setPassword("{noop}"+user.getPassword());
        service.register(user);
        rttr.addFlashAttribute("msg", "가입시 사용한 이메일로 인증해주세요.");
        rttr.addFlashAttribute("email", user.getEmail());

        return "redirect:/index";
    }

    //http://localhost:8080/user/emailConfirm?userEmail=asdf&emailAuthKey=xcxz
    @GetMapping("/emailConfirm")
    public String emailConfirm(@RequestParam String userEmail, @RequestParam String emailAuthKey, RedirectAttributes rttr) {
        log.info(userEmail);
        log.info(emailAuthKey);

        boolean enabled = service.updateEnabled(userEmail);

        if(enabled){
            rttr.addFlashAttribute("email", userEmail);
            return "redirect:login";
        }else {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/login")
    public String login(){
        return "user/login";
    }

    @RequestMapping("/jusoPopup")
    public String popup(@RequestParam(required = false) String roadFullAddr){
        System.out.println(roadFullAddr);
        return "user/jusoPopup";
    }

}
