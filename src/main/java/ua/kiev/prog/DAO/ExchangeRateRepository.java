package ua.kiev.prog.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.kiev.prog.Entity.ExchangeRate;

public interface ExchangeRateRepository extends JpaRepository<ExchangeRate, String> {

}
