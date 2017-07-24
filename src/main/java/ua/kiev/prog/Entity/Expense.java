package ua.kiev.prog.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ua.kiev.prog.Enum.UserCurrencyCode;

import javax.persistence.*;
import java.util.Date;

@Entity
@NoArgsConstructor
@Getter
@Setter
public class Expense {
    @Id
    @GeneratedValue
    private long id;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date date;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private UserCurrencyCode currencyCode;

    @Column(nullable = false)
    private long amount;

    @Column(nullable = false)
    private String category;

    @Column
    private String comment;

    @ManyToOne
    @JoinColumn(name = "customUser_id", nullable = false)
    private CustomUser customUser;

    public Expense(Date date, Long amount, UserCurrencyCode currencyCode, String category, String comment, CustomUser customUser) {
        this.date = date;
        this.amount = amount;
        this.currencyCode = currencyCode;
        this.category = category;
        this.comment = comment;
        this.customUser = customUser;
    }
}