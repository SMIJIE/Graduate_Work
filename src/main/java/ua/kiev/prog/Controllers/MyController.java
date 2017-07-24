package ua.kiev.prog.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.kiev.prog.Additional.YahooParser;
import ua.kiev.prog.Entity.CustomUser;
import ua.kiev.prog.Entity.EventSheduler;
import ua.kiev.prog.Entity.Expense;
import ua.kiev.prog.Entity.Income;
import ua.kiev.prog.Enum.UserCurrencyCode;
import ua.kiev.prog.Service.FinanseDAO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MyController {
    @Autowired
    private FinanseDAO finanseDAO;

    @RequestMapping("/")
    public String index(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);

        model.addAttribute("user", dbUser);
        model.addAttribute("amountIncome", getAmountOfIncome(getIncomeByUserAndMonth(dbUser, 0), dbUser.getCurrencyCode()));
        model.addAttribute("amountExpense", getAmountOfExpense(getExpenseByUserAndMonth(dbUser, 0), dbUser.getCurrencyCode()));
        model.addAttribute("annualAmountOfIncome", getAnnualReportByIncome(dbUser));
        model.addAttribute("annualAmountOfExpense", getAnnualReportByExpense(dbUser));
        model.addAttribute("EUR", String.format("%.2f", finanseDAO.getRateOfExchangeRate("EUR")));
        model.addAttribute("USD", String.format("%.2f", finanseDAO.getRateOfExchangeRate("USD")));

        model.addAttribute("eventSheduler", finanseDAO.findEventShedulerByUserAndCurrentDate(dbUser, new Date()));

        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        model.addAttribute("currentDate", sdf.format(new Date()));
        return "index";
    }

    @RequestMapping("/exchangeRate")
    public String getExchangeRate(Model model) {
        Date date = finanseDAO.getDateOfExchangeRates();
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");

        model.addAttribute("exchangeRates", finanseDAO.getExchangeRates());
        model.addAttribute("currentDate", sdf.format(date));

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);
        return "exchangeRate";
    }

    @RequestMapping("/userSettings")
    public String userSettings(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        return "userSettings";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser(@RequestParam(required = false) String login,
                             @RequestParam(required = false) String password,
                             @RequestParam(required = false) String email,
                             @RequestParam(required = false) String phone, Model model) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String log = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(log);

        model.addAttribute("user", dbUser);
        try {
            if (login.equals("") || email.equals("") || phone.equals("")) throw new NullPointerException();
            if (log.equals(login)) throw new NoSuchElementException();
            if (finanseDAO.existsByLogin(login)) throw new IllegalAccessException();
            dbUser.setLogin(login);
            throw new NoSuchElementException();
        } catch (NullPointerException e) {
            model.addAttribute("emptyFields", true);
            return "userSettings";
        } catch (IllegalAccessException e) {
            model.addAttribute("newLogin", login);
            model.addAttribute("exists", true);
            return "userSettings";
        } catch (NoSuchElementException e) {
            if (!password.equals("")) {
                ShaPasswordEncoder encoder = new ShaPasswordEncoder();
                String passHash = encoder.encodePassword(password, null);
                dbUser.setPassword(passHash);
            }
            dbUser.setEmail(email);
            dbUser.setPhone(phone);
            finanseDAO.updateUser(dbUser);
        }

        return "redirect:/login";
    }

    @RequestMapping("/currencySettings")
    public String currencySettings(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);
        model.addAttribute("currencyCodeName", YahooParser.translateCurrency(dbUser.getCurrencyCode().toString()));
        model.addAttribute("exchangeRates", finanseDAO.getExchangeRates());

        return "currencySettings";
    }

    @RequestMapping(value = "/updateCurrency", method = RequestMethod.POST)
    public String updateCurrency(@RequestParam(required = false) String currencyCode, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        dbUser.setCurrencyCode(currencyCode);
        finanseDAO.updateUser(dbUser);

        model.addAttribute("user", dbUser);

        return "redirect:/";
    }

    @RequestMapping("/help")
    public String help(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        return "help";
    }

    @RequestMapping("/entertainment")
    public String entertainment(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        return "entertainment";
    }

    @RequestMapping("/income")
    public String income(@RequestParam(required = false, defaultValue = "0") Integer month, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        Calendar calendar = Calendar.getInstance();
        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        Locale loc = Locale.forLanguageTag("en");
        SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy", loc);
        model.addAttribute("currentMonth", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("yyyy-MM-dd", loc);
        model.addAttribute("currentDate", sdf.format(calendar.getTime()));

        List<Income> list = getIncomeByUserAndMonth(dbUser, month);
        model.addAttribute("incomes", list);
        model.addAttribute("months", month);

        return "income";
    }

    @RequestMapping(value = "/addIncome", method = RequestMethod.POST)
    public String addIncome(@RequestParam(required = false) String date,
                            @RequestParam(required = false) String amount,
                            @RequestParam(required = false) String category,
                            @RequestParam(required = false) String comments,
                            Model model) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String log = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(log);
        model.addAttribute("user", dbUser);

        Calendar calendar = Calendar.getInstance();
        Locale loc = Locale.forLanguageTag("en");
        SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy", loc);
        model.addAttribute("currentMonth", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("yyyy-MM-dd", loc);
        model.addAttribute("currentDate", sdf.format(calendar.getTime()));

        List<Income> list;
        model.addAttribute("months", 0);

        try {
            if (amount == "") throw new NullPointerException();
            Income income = new Income(sdf.parse(date), Long.parseLong(amount), dbUser.getCurrencyCode(), category, comments, dbUser);
            finanseDAO.addIncome(income);
        } catch (ParseException | NullPointerException e) {
            list = getIncomeByUserAndMonth(dbUser, 0);
            model.addAttribute("incomes", list);
            model.addAttribute("emptyFields", true);
            return "income";
        }

        list = getIncomeByUserAndMonth(dbUser, 0);
        model.addAttribute("incomes", list);
        return "redirect:/income";
    }

    @RequestMapping("/deleteIncome")
    public String deleteIncome(@RequestParam(required = false) Long id) {
        finanseDAO.deleteIncome(id);
        return "redirect:/income";
    }

    @RequestMapping("/expense")
    public String expense(@RequestParam(required = false, defaultValue = "0") Integer month, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        Calendar calendar = Calendar.getInstance();
        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        Locale loc = Locale.forLanguageTag("en");
        SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy", loc);
        model.addAttribute("currentMonth", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("yyyy-MM-dd", loc);
        model.addAttribute("currentDate", sdf.format(calendar.getTime()));

        List<Expense> list = getExpenseByUserAndMonth(dbUser, month);
        model.addAttribute("expenses", list);
        model.addAttribute("months", month);

        return "expense";
    }

    @RequestMapping(value = "/addExpense", method = RequestMethod.POST)
    public String addExpense(@RequestParam(required = false) String date,
                             @RequestParam(required = false) String amount,
                             @RequestParam(required = false) String category,
                             @RequestParam(required = false) String comments, Model model) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String log = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(log);
        model.addAttribute("user", dbUser);

        Calendar calendar = Calendar.getInstance();
        Locale loc = Locale.forLanguageTag("en");
        SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy", loc);
        model.addAttribute("currentMonth", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("yyyy-MM-dd", loc);
        model.addAttribute("currentDate", sdf.format(calendar.getTime()));

        List<Expense> list;
        model.addAttribute("months", 0);

        try {
            if (amount == "") throw new NullPointerException();
            Expense expense = new Expense(sdf.parse(date), Long.parseLong(amount), dbUser.getCurrencyCode(), category, comments, dbUser);
            finanseDAO.addExpense(expense);
        } catch (ParseException | NullPointerException e) {
            list = getExpenseByUserAndMonth(dbUser, 0);
            model.addAttribute("expenses", list);
            model.addAttribute("emptyFields", true);
            return "expense";
        }

        list = getExpenseByUserAndMonth(dbUser, 0);
        model.addAttribute("expenses", list);
        return "redirect:/expense";
    }


    @RequestMapping("/deleteExpense")
    public String deleteExpense(@RequestParam(required = false) Long id) {
        finanseDAO.deleteExpense(id);
        return "redirect:/expense";
    }

    @RequestMapping("/analytics")
    public String analytics(@RequestParam(required = false, defaultValue = "0") Integer month, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);
        model.addAttribute("months", month);
        model.addAttribute("monthlyIncome", getMonthlyReportByIncome(dbUser, month));
        model.addAttribute("monthlyExpense", getMonthlyReportByExpense(dbUser, month));

        Calendar calendar = Calendar.getInstance();
        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        Locale loc = Locale.forLanguageTag("en");
        SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy", loc);
        model.addAttribute("currentMonth", sdf.format(calendar.getTime()));

        return "analytics";
    }

    @RequestMapping("/scheduler")
    public String scheduler(@RequestParam(required = false, defaultValue = "0") Integer month, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        Calendar calendar = Calendar.getInstance();
        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        Locale loc = Locale.forLanguageTag("en");
        SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy", loc);
        model.addAttribute("currentMonth", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("HH:mm", loc);
        model.addAttribute("currentTime", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("yyyy-MM-dd", loc);
        model.addAttribute("currentDate", sdf.format(calendar.getTime()));
        model.addAttribute("currentDay", calendar.get(Calendar.DAY_OF_MONTH));
        model.addAttribute("months", month);
        model.addAttribute("dayOfMonthAndWeeks", getDayOfMonthAndWeeks(calendar));
        model.addAttribute("monthlyEventSheduler", getEventShedulerByUserAndMonth(dbUser, month));
        return "scheduler";
    }

    @RequestMapping(value = "/addEventSheduler", method = RequestMethod.GET)
    public String addEvent(@RequestParam(required = false) String date,
                           @RequestParam(required = false) String time,
                           @RequestParam(required = false) String event,
                           @RequestParam(required = false) String category,
                           @RequestParam(required = false) String amount, Model model) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = finanseDAO.getUserByLogin(login);
        model.addAttribute("user", dbUser);

        Calendar calendar = Calendar.getInstance();
        Locale loc = Locale.forLanguageTag("en");
        SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy", loc);
        model.addAttribute("currentMonth", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("HH:mm", loc);
        model.addAttribute("currentTime", sdf.format(calendar.getTime()));
        sdf = new SimpleDateFormat("yyyy-MM-dd", loc);
        model.addAttribute("currentDate", sdf.format(calendar.getTime()));
        model.addAttribute("currentDay", calendar.get(Calendar.DAY_OF_MONTH));
        model.addAttribute("months", 0);
        model.addAttribute("dayOfMonthAndWeeks", getDayOfMonthAndWeeks(calendar));
        model.addAttribute("monthlyEventSheduler", getEventShedulerByUserAndMonth(dbUser, 0));

        try {
            EventSheduler eventSheduler = null;
            Income income = null;
            Expense expense = null;
            long idOfIncomeOrExpense = 0;

            if (event.equals("")) throw new NullPointerException();
            if (!category.equals("Nothing") && !amount.equals("")) {
                if (category.equals("Income") && Long.parseLong(amount) != 0) {
                    income = new Income(sdf.parse(date), Long.parseLong(amount), dbUser.getCurrencyCode(), "Sheduler", event, dbUser);
                    finanseDAO.addIncome(income);
                    idOfIncomeOrExpense = income.getId();
                } else if (category.equals("Expense") && Long.parseLong(amount) != 0) {
                    expense = new Expense(sdf.parse(date), Long.parseLong(amount), dbUser.getCurrencyCode(), "Sheduler", event, dbUser);
                    finanseDAO.addExpense(expense);
                    idOfIncomeOrExpense = expense.getId();
                }
            }

            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
            if (income == null && expense == null) {
                eventSheduler = new EventSheduler(sdf.parse(date), sdf2.parse(time), event, category, null, null, dbUser);
            } else if (idOfIncomeOrExpense != 0) {
                eventSheduler = new EventSheduler(sdf.parse(date), sdf2.parse(time), event, category, Long.parseLong(amount), idOfIncomeOrExpense, dbUser);
            }
            finanseDAO.addEventSheduler(eventSheduler);
        } catch (ParseException | NullPointerException e) {
            model.addAttribute("emptyFields", true);
            return "scheduler";
        }

        return "redirect:/scheduler";
    }

    @RequestMapping("/deleteEventSheduler")
    public String deleteEventSheduler(@RequestParam(required = false) Long id) {

        EventSheduler eventSheduler = finanseDAO.getEventShedulerById(id);
        if (eventSheduler.getCategory().equals("Income")) {
            finanseDAO.deleteIncome(eventSheduler.getIdOfIncomeOrExpense());
        } else if (eventSheduler.getCategory().equals("Expense")) {
            finanseDAO.deleteExpense(eventSheduler.getIdOfIncomeOrExpense());
        }
        finanseDAO.deleteEventSheduler(id);

        return "redirect:/scheduler";
    }

    private List<Income> getIncomeByUserAndMonth(CustomUser dbUser, Integer month) {
        Calendar calendar = Calendar.getInstance();

        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        calendar.set(Calendar.DAY_OF_MONTH, 01);
        Date minDate = calendar.getTime();
        calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + 1));
        Date maxDate = calendar.getTime();

        return finanseDAO.findIncomeByUserAndMonth(dbUser, minDate, maxDate);
    }

    private List<Income> getIncomeByUserAndMonthForAnnualReport(CustomUser dbUser, Integer month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, month);
        calendar.set(Calendar.DAY_OF_MONTH, 01);
        Date minDate = calendar.getTime();
        calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + 1));
        Date maxDate = calendar.getTime();

        return finanseDAO.findIncomeByUserAndMonth(dbUser, minDate, maxDate);
    }

    private List<Income> getIncomeByUserAndMonthForMonthlyReport(CustomUser dbUser, Integer month, Integer day) {
        Calendar calendar = Calendar.getInstance();

        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        calendar.set(Calendar.DAY_OF_MONTH, day);

        return finanseDAO.findIncomeByUserAndMonthForMonthReport(dbUser, calendar.getTime());
    }

    private long getAmountOfIncome(List<Income> incomes, UserCurrencyCode currencyCodeOfUser) {
        long amount = 0;

        for (Income income : incomes) {
            if (income.getCurrencyCode().equals(currencyCodeOfUser)) {
                amount += income.getAmount();
            } else {
                double rate = finanseDAO.getRateOfExchangeRate(income.getCurrencyCode().toString());
                amount += (rate * income.getAmount()) / finanseDAO.getRateOfExchangeRate(currencyCodeOfUser.toString());
            }
        }
        return amount;
    }

    private HashMap<String, Long> getAnnualReportByIncome(CustomUser dbUser) {
        HashMap<String, Long> annualReport = new LinkedHashMap<>();
        Calendar cl = Calendar.getInstance();
        Locale loc = Locale.forLanguageTag("en");

        for (int i = 0; i < 12; i++) {
            cl.set(Calendar.MONTH, i);
            long amount = getAmountOfIncome(getIncomeByUserAndMonthForAnnualReport(dbUser, i), dbUser.getCurrencyCode());
            annualReport.put(cl.getDisplayName(Calendar.MONTH, Calendar.SHORT, loc) + ".", amount);
        }

        return annualReport;
    }

    private HashMap<String, Long> getMonthlyReportByIncome(CustomUser dbUser, Integer month) {
        HashMap<String, Long> monthlyReport = new LinkedHashMap<>();
        Calendar calendar = Calendar.getInstance();

        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        for (int i = 1; i <= calendar.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
            long amount = getAmountOfIncome(getIncomeByUserAndMonthForMonthlyReport(dbUser, month, i), dbUser.getCurrencyCode());
            monthlyReport.put(String.valueOf(i), amount);
        }

        return monthlyReport;
    }

    private List<Expense> getExpenseByUserAndMonth(CustomUser dbUser, Integer month) {
        Calendar calendar = Calendar.getInstance();

        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        calendar.set(Calendar.DAY_OF_MONTH, 01);
        Date minDate = calendar.getTime();
        calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + 1));
        Date maxDate = calendar.getTime();

        return finanseDAO.findExpenseByUserAndMonth(dbUser, minDate, maxDate);
    }

    private List<Expense> getExpenseByUserAndMonthForAnnualReport(CustomUser dbUser, Integer month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, month);
        calendar.set(Calendar.DAY_OF_MONTH, 01);
        Date minDate = calendar.getTime();
        calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + 1));
        Date maxDate = calendar.getTime();

        return finanseDAO.findExpenseByUserAndMonth(dbUser, minDate, maxDate);
    }

    private List<Expense> getExpenseByUserAndMonthForMonthlyReport(CustomUser dbUser, Integer month, Integer day) {
        Calendar calendar = Calendar.getInstance();

        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        calendar.set(Calendar.DAY_OF_MONTH, day);

        return finanseDAO.findExpenseByUserAndMonthForMonthReport(dbUser, calendar.getTime());
    }

    private long getAmountOfExpense(List<Expense> expenses, UserCurrencyCode currencyCodeOfUser) {
        long amount = 0;

        for (Expense expense : expenses) {
            if (expense.getCurrencyCode().equals(currencyCodeOfUser)) {
                amount += expense.getAmount();
            } else {
                double rate = finanseDAO.getRateOfExchangeRate(expense.getCurrencyCode().toString());
                amount += (rate * expense.getAmount()) / finanseDAO.getRateOfExchangeRate(currencyCodeOfUser.toString());
            }
        }

        return amount;
    }


    private HashMap<String, Long> getAnnualReportByExpense(CustomUser dbUser) {
        HashMap<String, Long> annualReport = new LinkedHashMap<>();
        Calendar cl = Calendar.getInstance();
        Locale loc = Locale.forLanguageTag("en");

        for (int i = 0; i < 12; i++) {
            cl.set(Calendar.MONTH, i);
            long amount = getAmountOfExpense(getExpenseByUserAndMonthForAnnualReport(dbUser, i), dbUser.getCurrencyCode());
            annualReport.put(cl.getDisplayName(Calendar.MONTH, Calendar.SHORT, loc) + ".", amount);
        }

        return annualReport;
    }

    private HashMap<String, Long> getMonthlyReportByExpense(CustomUser dbUser, Integer month) {
        HashMap<String, Long> monthlyReport = new LinkedHashMap<>();
        Calendar calendar = Calendar.getInstance();

        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        for (int i = 1; i <= calendar.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
            long amount = getAmountOfExpense(getExpenseByUserAndMonthForMonthlyReport(dbUser, month, i), dbUser.getCurrencyCode());
            monthlyReport.put(String.valueOf(i), amount);
        }

        return monthlyReport;
    }

    private HashMap<Long, String> getDayOfMonthAndWeeks(Calendar calendar) {
        HashMap<Long, String> dayOfMonthAndWeeks = new LinkedHashMap<>();
        Calendar cal = calendar;
        Locale loc = Locale.forLanguageTag("en");

        for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
            cal.set(Calendar.DAY_OF_MONTH, i);
            dayOfMonthAndWeeks.put(Long.valueOf(i), calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, loc));
        }

        return dayOfMonthAndWeeks;
    }

    private HashMap<Long, List<EventSheduler>> getEventShedulerByUserAndMonth(CustomUser dbUser, Integer month) {
        Calendar calendar = Calendar.getInstance();

        if (month != 0) {
            calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + month));
        }

        calendar.set(Calendar.DAY_OF_MONTH, 01);
        Date minDate = calendar.getTime();
        calendar.set(Calendar.MONTH, (calendar.get(Calendar.MONTH) + 1));
        Date maxDate = calendar.getTime();

        HashMap<Long, List<EventSheduler>> eventShedulerByDay = new LinkedHashMap<>();

        List<EventSheduler> list = finanseDAO.findEventShedulerByUserAndMonth(dbUser, minDate, maxDate);
        SimpleDateFormat sdf = new SimpleDateFormat("d");
        for (EventSheduler eventSheduler : list) {
            List<EventSheduler> list2 = new ArrayList<>();
            if (!eventShedulerByDay.containsKey(Long.parseLong(sdf.format(eventSheduler.getDate())))) {
                list2.add(eventSheduler);
                eventShedulerByDay.put(Long.parseLong(sdf.format(eventSheduler.getDate())), list2);
                list2 = null;
            } else {
                list2 = eventShedulerByDay.get(Long.parseLong(sdf.format(eventSheduler.getDate())));
                list2.add(eventSheduler);
                eventShedulerByDay.put(Long.parseLong(sdf.format(eventSheduler.getDate())), list2);
                list2 = null;
            }
        }
        return eventShedulerByDay;
    }
}
