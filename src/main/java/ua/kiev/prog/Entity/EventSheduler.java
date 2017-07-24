package ua.kiev.prog.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@NoArgsConstructor
@Getter
@Setter
public class EventSheduler {
    @Id
    @GeneratedValue
    private long id;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date date;

    @Column(nullable = false)
    @Temporal(TemporalType.TIME)
    private Date time;

    @Column(nullable = false)
    private String event;

    @Column(nullable = false)
    private String category;

    @Column
    private Long amount;

    @Column
    private Long idOfIncomeOrExpense;

    @ManyToOne
    @JoinColumn(name = "customUser_id", nullable = false)
    private CustomUser customUser;

    public EventSheduler(Date date, Date time, String event, String category, Long amount, Long idOfIncomeOrExpense, CustomUser customUser) {
        this.date = date;
        this.time = time;
        this.event = event;
        this.category = category;
        this.amount = amount;
        this.idOfIncomeOrExpense = idOfIncomeOrExpense;
        this.customUser = customUser;
    }
}
