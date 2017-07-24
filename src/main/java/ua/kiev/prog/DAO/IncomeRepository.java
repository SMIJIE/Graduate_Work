package ua.kiev.prog.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.kiev.prog.Entity.CustomUser;
import ua.kiev.prog.Entity.Income;

import java.util.Date;
import java.util.List;


public interface IncomeRepository extends JpaRepository<Income, Long> {
    @Query("SELECT i FROM Income i WHERE i.customUser = :customUser AND i.date >= :minDate AND i.date < :maxDate ORDER BY i.date ASC")
    List<Income> findByUserAndMonth(@Param("customUser") CustomUser customUser, @Param("minDate") Date minDate, @Param("maxDate") Date maxDate);

    @Query("SELECT i FROM Income i WHERE i.customUser = :customUser AND i.date = :date ORDER BY i.date ASC")
    List<Income> findByUserAndMonthForMonthReport(@Param("customUser") CustomUser customUser, @Param("date") Date date);
}
