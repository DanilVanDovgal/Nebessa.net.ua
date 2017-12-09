package ua.kiev.dans.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.kiev.dans.model.CustomUser;
import java.util.List;

public interface CustomUserRepository extends JpaRepository<CustomUser, Long> {

    @Query("SELECT u FROM CustomUser u where u.login = :login")
    CustomUser findByLogin(@Param("login") String login);

    @Query("SELECT CASE WHEN COUNT(u) > 0 THEN true ELSE false END FROM CustomUser u WHERE u.login = :login Or u.email = :email")
    boolean existByEmailOrLogin(@Param("email") String email, @Param("login") String login);

    CustomUser findByEmail(String email);

    @Query("SELECT u FROM CustomUser u")
    List<CustomUser> getAllUsers(Pageable pageable);

    long count();
}
