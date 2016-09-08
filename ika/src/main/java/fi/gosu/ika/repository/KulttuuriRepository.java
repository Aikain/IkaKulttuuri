package fi.gosu.ika.repository;

import fi.gosu.ika.domain.Kulttuuri;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KulttuuriRepository extends JpaRepository<Kulttuuri, Long> {

}
