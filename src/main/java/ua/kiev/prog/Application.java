package ua.kiev.prog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import ua.kiev.prog.Additional.CurrencyConverterApi;
import ua.kiev.prog.Entity.ExchangeRate;
import ua.kiev.prog.Service.FinanseDAO;

import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.Map;
import java.util.Set;

@SpringBootApplication
@EnableScheduling
public class Application {
    @Autowired
    private FinanseDAO finanseDAO;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Scheduled(fixedDelay = 3600000)
    public void getExchangeRates() throws IOException {
        LocalDate localDate = LocalDate.now();
        Map<String, Double> currencyMap = CurrencyConverterApi.getExchangeRate(localDate);

        Set<Map.Entry<String, Double>> setOfEntry = currencyMap.entrySet();
        setOfEntry.forEach(entry -> {
            ExchangeRate exchangeRate = null;
            String currencyName = CurrencyConverterApi.translateCurrency(entry.getKey());
            try {
                exchangeRate = new ExchangeRate(entry.getKey(), currencyName, entry.getValue(), localDate.toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            finanseDAO.addExchangeRate(exchangeRate);
        });
    }
}