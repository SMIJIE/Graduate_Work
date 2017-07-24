package ua.kiev.prog.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.kiev.prog.Entity.CustomUser;
import ua.kiev.prog.Enum.UserCurrencyCode;
import ua.kiev.prog.Enum.UserRole;
import ua.kiev.prog.Service.FinanseDAO;

@Controller
public class RegisterController {
    @Autowired
    private FinanseDAO finanseDAO;

    @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String newUser(@RequestParam String login,
                          @RequestParam String password,
                          @RequestParam String email,
                          @RequestParam String phone,
                          Model model) {

        if (login == "" || password == "" || email == "" || phone == "") {
            model.addAttribute("emptyFields", true);
            return "register";
        }

        if (finanseDAO.existsByLogin(login)) {
            model.addAttribute("newLogin", login);
            model.addAttribute("exists", true);
            return "register";
        }

        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        String passHash = encoder.encodePassword(password, null);

        CustomUser dbUser = new CustomUser(login, passHash, UserRole.USER, email, phone, UserCurrencyCode.UAH);
        finanseDAO.addUser(dbUser);
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }
}
