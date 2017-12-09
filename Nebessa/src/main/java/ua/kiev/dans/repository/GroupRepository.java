package ua.kiev.dans.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.kiev.dans.model.Group;

public interface GroupRepository extends JpaRepository<Group, Long> {
}
