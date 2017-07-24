package ua.kiev.prog.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.kiev.prog.Entity.CustomUser;
import ua.kiev.prog.Entity.Expense;

import java.util.Date;
import java.util.List;

public interface ExpenseRepository extends JpaRepository<Expense, Long> {
    @Query("SELECT e FROM Expense e WHERE e.customUser = :customUser AND e.date >= :minDate AND e.date < :maxDate ORDER BY e.date ASC")
    List<Expense> findByUserAndMonth(@Param("customUser") CustomUser customUser, @Param("minDate") Date minDate, @Param("maxDate") Date maxDate);

    @Query("SELECT e FROM Expense e WHERE e.customUser = :customUser AND e.date = :date ORDER BY e.date ASC")
    List<Expense> findByUserAndMonthForMonthReport(@Param("customUser") CustomUser customUser, @Param("date") Date date);
}
