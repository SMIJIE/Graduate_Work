package ua.kiev.prog.Enum;

public enum UserCurrencyCode {
    UAH, EUR, USD, AUD, CAD, CNY, BYR, RUB, CZK, JPY, GBP, BGN, PLN, SEK, CHF;

    @Override
    public String toString() {
        return name();
    }
}
