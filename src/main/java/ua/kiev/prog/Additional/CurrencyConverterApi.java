package ua.kiev.prog.Additional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CurrencyConverterApi {
    /**
     * Example:
     * <p>
     * http://free.currencyconverterapi.com/api/v5/convert
     * ?q=USD_UAH,EUR_UAH,AUD_UAH,CAD_UAH,CNY_UAH,BYR_UAH,RUB_UAH,CZK_UAH,JPY_UAH,GBP_UAH,BGN_UAH,PLN_UAH,SEK_UAH,CHF_UAH,UAH_UAH
     * &compact=ultra
     * &date=yyyy-mm-dd
     */
    public synchronized static Map<String, Double> getExchangeRate(LocalDate currentDate) throws IOException {

        String request = "http://free.currencyconverterapi.com/api/v5/convert" +
                "?q=putYourCurrencyLikeFromTo" +
                "&compact=ultra" +
                "&date=" + currentDate;

        Map<String, JsonNode> allCurrency = performRequest(request);
        Map<String, Double> returnMap = allCurrency.entrySet().stream()
                .map(e -> new Map.Entry<String, Double>() {
                    @Override
                    public String getKey() {
                        return e.getKey().substring(0, 3);
                    }

                    @Override
                    public Double getValue() {
                        JsonNode tempNode = e.getValue();
                        String tempStr = String.valueOf(tempNode.get(currentDate.toString()));
                        return Double.valueOf(tempStr);
                    }

                    // ToDO
                    @Override
                    public Double setValue(Double value) {
                        return null;
                    }
                })
                .collect(Collectors.toMap(e -> e.getKey()
                        , e -> e.getValue()
                        , (val1, val2) -> val2
                        , HashMap::new));

        return returnMap;
    }

    /**
     * https://free.currencyconverterapi.com/
     * <p>
     * Rate Limits of the Free API
     * <p>
     * Conversion Pairs per Request: 2
     * Number of Requests per Hour: 100
     * Date Range in History: 8 Days
     * Allowed Back in History: 1 Year(s)
     */
    private static Map<String, JsonNode> performRequest(String request) throws MalformedURLException {
        ObjectMapper mapper = new ObjectMapper();
        List<URL> urlList = new ArrayList<>();

        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "USD_UAH,EUR_UAH")));
        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "AUD_UAH,CAD_UAH")));
        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "CNY_UAH,BYR_UAH")));
        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "RUB_UAH,CZK_UAH")));
        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "JPY_UAH,GBP_UAH")));
        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "BGN_UAH,PLN_UAH")));
        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "SEK_UAH,CHF_UAH")));
        urlList.add(new URL(request.replace("putYourCurrencyLikeFromTo", "UAH_UAH")));

        Map<String, JsonNode> map = new HashMap<>();

        urlList.forEach(url -> {
            try {
                map.putAll(mapper.readValue(url, new TypeReference<Map<String, JsonNode>>() {
                }));
            } catch (IOException e) {
                e.printStackTrace();
            }
        });

        return map;
    }

    public static String translateCurrency(String currencyCode) {
        String currency = "";
        switch (currencyCode) {
            case "EUR":
                currency = "Euro";
                break;
            case "USD":
                currency = "U.S. Dollar";
                break;
            case "AUD":
                currency = "Australian Dollar";
                break;
            case "CAD":
                currency = "Canadian Dollar";
                break;
            case "CNY":
                currency = "Chinese Yuan";
                break;
            case "BYR":
                currency = "Belarusian Rubles";
                break;
            case "RUB":
                currency = "Russian Ruble";
                break;
            case "CZK":
                currency = "Czech Crowns";
                break;
            case "JPY":
                currency = "Japanese Yen";
                break;
            case "GBP":
                currency = "Pound Sterling of the United Kingdom";
                break;
            case "BGN":
                currency = "Bulgarian Lion";
                break;
            case "PLN":
                currency = "Polish Zloty";
                break;
            case "SEK":
                currency = "Swedish Kronor";
                break;
            case "CHF":
                currency = "Swiss Frank";
                break;
            case "UAH":
                currency = "Ukrainian Hryvnia";
                break;
        }
        return currency;
    }
}