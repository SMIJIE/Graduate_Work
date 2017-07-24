package ua.kiev.prog.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ua.kiev.prog.Enum.UserCurrencyCode;
import ua.kiev.prog.Enum.UserRole;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor
@Getter
@Setter
public class CustomUser {
    @Id
    @GeneratedValue
    private long id;

    @Column(nullable = false)
    private String login;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private UserRole role;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String phone;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private UserCurrencyCode currencyCode;

    @OneToMany(mappedBy = "customUser", cascade = CascadeType.ALL)
    private List<Income> income = new ArrayList<Income>();

    @OneToMany(mappedBy = "customUser", cascade = CascadeType.ALL)
    private List<Expense> expense = new ArrayList<Expense>();

    @OneToMany(mappedBy = "customUser", cascade = CascadeType.ALL)
    private List<EventSheduler> eventSheduler = new ArrayList<EventSheduler>();

    public CustomUser(String login, String password, UserRole role, String email, String phone, UserCurrencyCode currencyCode) {
        this.login = login;
        this.password = password;
        this.role = role;
        this.email = email;
        this.phone = phone;
        this.currencyCode = currencyCode;
    }

    public void setRole(String role) {
        this.role = UserRole.valueOf(role);
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = UserCurrencyCode.valueOf(currencyCode);
    }
}
