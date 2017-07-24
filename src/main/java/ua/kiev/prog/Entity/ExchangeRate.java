package ua.kiev.prog.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@NoArgsConstructor
@Getter
@Setter
public class ExchangeRate {

    @Id
    private String codeCurrency;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private double rate;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date date;

    public ExchangeRate(String codeCurrency, String name, double rate, String dateStr) throws ParseException {
        this.codeCurrency = codeCurrency;
        this.name = name;
        this.rate = rate;
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        this.date = sdf.parse(dateStr);
    }

}