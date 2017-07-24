package ua.kiev.prog.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import ua.kiev.prog.DAO.*;
import ua.kiev.prog.Entity.*;

import java.util.Date;
import java.util.List;

@org.springframework.stereotype.Service
public class FinanseDAOImplementation implements FinanseDAO {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ExchangeRateRepository exchangeRateRepository;
    @Autowired
    private IncomeRepository incomeRepository;
    @Autowired
    private ExpenseRepository expenseRepository;
    @Autowired
    private EventShedulerRepository eventShedulerRepository;

    @Override
    @Transactional(readOnly = true)
    public CustomUser getUserByLogin(String login) {
        return userRepository.findByLogin(login);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existsByLogin(String login) {
        return userRepository.existsByLogin(login);
    }

    @Override
    @Transactional
    public void addUser(CustomUser customUser) {
        userRepository.save(customUser);
    }

    @Override
    @Transactional
    public void updateUser(CustomUser customUser) {
        userRepository.save(customUser);
    }

    @Override
    @Transactional(readOnly = true)
    public List<CustomUser> getAllUsers(Pageable pageable) {
        return userRepository.findAll(pageable).getContent();
    }

    @Override
    @Transactional
    public void deleteUsers(long[] idList) {
        for (long id : idList) {
            userRepository.delete(id);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public long count() {
        return userRepository.count();
    }

    @Override
    @Transactional(readOnly = true)
    public List<CustomUser> findByPattern(String pattern, Pageable pageable) {
        return userRepository.findByPattern(pattern, pageable);
    }

    @Override
    @Transactional
    public void addExchangeRate(ExchangeRate exchangeRate) {
        exchangeRateRepository.save(exchangeRate);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ExchangeRate> getExchangeRates() {
        return exchangeRateRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Date getDateOfExchangeRates() {
        return exchangeRateRepository.getOne("EUR").getDate();
    }

    @Override
    @Transactional(readOnly = true)
    public double getRateOfExchangeRate(String codeCurrency) {
        return exchangeRateRepository.getOne(codeCurrency).getRate();
    }

    @Override
    @Transactional
    public void addIncome(Income income) {
        incomeRepository.save(income);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Income> findIncomeByUserAndMonth(CustomUser customUser, Date minDate, Date maxDate) {
        return incomeRepository.findByUserAndMonth(customUser, minDate, maxDate);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Income> findIncomeByUserAndMonthForMonthReport(CustomUser customUser, Date date) {
        return incomeRepository.findByUserAndMonthForMonthReport(customUser, date);
    }

    @Override
    @Transactional
    public void deleteIncome(long id) {
        incomeRepository.delete(id);
    }

    @Override
    @Transactional
    public void addExpense(Expense expense) {
        expenseRepository.save(expense);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Expense> findExpenseByUserAndMonth(CustomUser customUser, Date minDate, Date maxDate) {
        return expenseRepository.findByUserAndMonth(customUser, minDate, maxDate);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Expense> findExpenseByUserAndMonthForMonthReport(CustomUser customUser, Date date) {
        return expenseRepository.findByUserAndMonthForMonthReport(customUser, date);
    }

    @Override
    @Transactional
    public void deleteExpense(long id) {
        expenseRepository.delete(id);
    }

    @Override
    @Transactional
    public void addEventSheduler(EventSheduler eventSheduler) {
        eventShedulerRepository.save(eventSheduler);
    }

    @Override
    public EventSheduler getEventShedulerById(long id) {
        return eventShedulerRepository.getOne(id);
    }

    @Override
    public void deleteEventSheduler(long id) {
        eventShedulerRepository.delete(id);
    }

    @Override
    @Transactional
    public List<EventSheduler> findEventShedulerByUserAndMonth(CustomUser customUser, Date minDate, Date maxDate) {
        return eventShedulerRepository.findByUserAndMonth(customUser, minDate, maxDate);
    }

    @Override
    @Transactional
    public List<EventSheduler> findEventShedulerByUserAndCurrentDate(CustomUser customUser, Date currentDate) {
        return eventShedulerRepository.findByUserAndCurrentDate(customUser, currentDate);
    }
}
