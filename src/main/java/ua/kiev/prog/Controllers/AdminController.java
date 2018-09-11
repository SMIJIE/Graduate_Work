package ua.kiev.prog.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.kiev.prog.Entity.CustomUser;
import ua.kiev.prog.Service.FinanseDAO;

import java.util.List;


@Controller
public class AdminController {
    static final int ITEMS_PER_PAGE = 15;
    @Autowired
    private FinanseDAO finanseDAO;

    @RequestMapping("/usersForAdmin")
    public String usersForAdmin(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        if (dbUser == null) {
            return "login";
        }
        model.addAttribute("user", dbUser);

        List<CustomUser> users = finanseDAO.getAllUsers(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.ASC, "login"));
        model.addAttribute("allUsers", users);
        model.addAttribute("allPages", getPageCount());

        return "usersForAdmin";
    }

    @RequestMapping(value = "/users/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> delete(@RequestParam(value = "toDelete[]", required = false) long[] toDelete) {
        if (toDelete != null && toDelete.length > 0) {
            finanseDAO.deleteUsers(toDelete);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam String pattern, @RequestParam(required = false, defaultValue = "0") Integer page, Model model) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        List<CustomUser> users = finanseDAO.findByPattern(pattern, new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.ASC, "login"));
        model.addAttribute("allUsers", users);
        model.addAttribute("allPages", getPageCount());
        return "usersForAdmin";
    }

    @RequestMapping("/update/{login}")
    public String updateUsers(@PathVariable("login") String login, Model model, @RequestParam(required = false) String newLogin,
                              @RequestParam(required = false) String email,
                              @RequestParam(required = false) String phone,
                              @RequestParam(required = false) String role,
                              @RequestParam(required = false, defaultValue = "0") Integer page) {

        CustomUser dbUser2 = finanseDAO.getUserByLogin(login);
        dbUser2.setLogin(newLogin);
        dbUser2.setEmail(email);
        dbUser2.setPhone(phone);
        dbUser2.setRole(role);
        finanseDAO.updateUser(dbUser2);

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String log = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(log);
        model.addAttribute("user", dbUser);

        List<CustomUser> users = finanseDAO.getAllUsers(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.ASC, "login"));
        model.addAttribute("allUsers", users);
        model.addAttribute("allPages", getPageCount());

        return "redirect:/usersForAdmin";
    }

    private long getPageCount() {
        long totalCount = finanseDAO.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
