package ua.kiev.prog.Service;

import org.springframework.data.domain.Pageable;
import ua.kiev.prog.Entity.*;

import java.util.Date;
import java.util.List;

public interface FinanseDAO {
    public CustomUser getUserByLogin(String login);
    public boolean existsByLogin(String login);
    public void addUser(CustomUser customUser);
    public void updateUser(CustomUser customUser);
    public List<CustomUser> getAllUsers(Pageable pageable);
    public void deleteUsers(long[] idList);
    public long count();
    public List<CustomUser> findByPattern(String pattern, Pageable pageable);

    public void addExchangeRate(ExchangeRate exchangeRate);
    public List<ExchangeRate> getExchangeRates();
    public Date getDateOfExchangeRates();
    public double getRateOfExchangeRate(String codeCurrency);

    public void addIncome(Income income);
    public List<Income> findIncomeByUserAndMonth(CustomUser customUser,Date minDate,Date maxDate);
    public List<Income> findIncomeByUserAndMonthForMonthReport(CustomUser customUser,Date date);
    public void deleteIncome(long id);


    public void addExpense(Expense expense);
    public List<Expense> findExpenseByUserAndMonth(CustomUser customUser,Date minDate,Date maxDate);
    public List<Expense> findExpenseByUserAndMonthForMonthReport(CustomUser customUser,Date date);
    public void deleteExpense(long id);

    public void addEventSheduler(EventSheduler eventSheduler);
    public EventSheduler getEventShedulerById(long id);
    public void deleteEventSheduler(long id);
    public List<EventSheduler> findEventShedulerByUserAndMonth(CustomUser customUser,Date minDate,Date maxDate);
    public List<EventSheduler> findEventShedulerByUserAndCurrentDate(CustomUser customUser,Date currentDate);
}
