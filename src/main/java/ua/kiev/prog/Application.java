package ua.kiev.prog;

import jdk.internal.org.xml.sax.SAXException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import ua.kiev.prog.Additional.YahooParser;
import ua.kiev.prog.Entity.CustomUser;
import ua.kiev.prog.Entity.ExchangeRate;
import ua.kiev.prog.Enum.UserCurrencyCode;
import ua.kiev.prog.Enum.UserRole;
import ua.kiev.prog.Service.FinanseDAO;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.text.ParseException;

@SpringBootApplication
@EnableScheduling
public class Application {
    @Autowired
    private FinanseDAO finanseDAO;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Scheduled(fixedDelay = 3600000)
    public void getExchangeRates() {
        String str = "";
        try {
            str = YahooParser.getExchangeRate();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        }

        if (str != null) {
            String[] arr = str.split(";");
            for (int i = 0; i < arr.length; i++) {
                String[] arr2 = arr[i].split("=");
                ExchangeRate exchangeRate = null;
                try {
                    exchangeRate = new ExchangeRate(arr2[0], arr2[1], Double.parseDouble(arr2[2]), arr2[3]);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                finanseDAO.addExchangeRate(exchangeRate);
            }
        }
    }
}