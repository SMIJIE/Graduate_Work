package ua.kiev.prog.Additional;

import jdk.internal.org.xml.sax.SAXException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class YahooParser {

    public synchronized static String getExchangeRate() throws IOException, ParserConfigurationException, SAXException {
        String request = "http://query.yahooapis.com/v1/public/yql?format=xml&q=select%20*%20from%20"
                + "yahoo.finance.xchange%20where%20pair%20in%20(\"EURUAH\",%20\"USDUAH\",%20\"AUDUAH\",%20\"CADUAH\",%20\"CNYUAH\",%20\"BYRUAH\",%20\"RUBUAH\",%20\"CZKUAH\",%20\"JPYUAH\",%20\"GBPUAH\",%20\"BGNUAH\",%20\"PLNUAH\",%20\"SEKUAH\",%20\"CHFUAH\",%20\"UAHUAH\")&env=store://datatables.org/alltableswithkeys";
        String result = performRequest(request);
        String str = "";
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

        try {
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document d = db.parse(new InputSource(new StringReader(result)));
            Element root = d.getDocumentElement();
            NodeList nodeList = root.getChildNodes();

            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);

                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) node;
                    NodeList nodeListRates = element.getChildNodes();

                    for (int j = 0; j < nodeListRates.getLength(); j++) {
                        String code = element.getElementsByTagName("Name").item(j).getChildNodes().item(0).getNodeValue();
                        String rate = element.getElementsByTagName("Rate").item(j).getChildNodes().item(0).getNodeValue();
                        String[] arr = code.split("/");
                        String name = translateCurrency(arr[0]);
                        String date = element.getElementsByTagName("Date").item(j).getChildNodes().item(0).getNodeValue();

                        str += arr[0] + "=" + name + "=" + rate + "=" + date;
                        if (j != (nodeListRates.getLength() - 1)) {
                            str += ";";
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

    private static String performRequest(String urlStr) throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection http = (HttpURLConnection) url.openConnection();
        StringBuilder sb = new StringBuilder();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(http.getInputStream()))) {
            String str = "";
            for (; (str = br.readLine()) != null; ) {
                sb.append(str);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
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