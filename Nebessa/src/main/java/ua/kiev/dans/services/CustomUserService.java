package ua.kiev.dans.services;

import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import ua.kiev.dans.model.CustomUser;
import java.util.List;

public interface CustomUserService {
    CustomUser getUserByEmail(String email);
    void updateUser(CustomUser customUser);
    void getByEmailAndUpdate(String email, String firstName, String lastName,
                             String birthday, String phone);
    String addUserIfNotExists(String email, String login, String password, long maxMemory, Model model);
    List<CustomUser> getAllUsers(Pageable pageable);
    long countAll();
    void deleteUser(long id[]);
}
