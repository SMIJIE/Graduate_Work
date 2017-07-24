package ua.kiev.prog.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.kiev.prog.Entity.CustomUser;
import ua.kiev.prog.Entity.EventSheduler;
import ua.kiev.prog.Entity.Income;

import java.util.Date;
import java.util.List;

public interface EventShedulerRepository extends JpaRepository<EventSheduler, Long> {
    @Query("SELECT e FROM EventSheduler e WHERE e.customUser = :customUser AND e.date >= :minDate AND e.date < :maxDate ORDER BY e.time ASC")
    List<EventSheduler> findByUserAndMonth(@Param("customUser") CustomUser customUser, @Param("minDate") Date minDate, @Param("maxDate") Date maxDate);

    @Query("SELECT e FROM EventSheduler e WHERE e.customUser = :customUser AND e.date = :currentDate ORDER BY e.time ASC")
    List<EventSheduler> findByUserAndCurrentDate(@Param("customUser") CustomUser customUser, @Param("currentDate") Date currentDate);
}
