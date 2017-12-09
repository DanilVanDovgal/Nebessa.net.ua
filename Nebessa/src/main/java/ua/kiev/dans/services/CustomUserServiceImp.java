package ua.kiev.dans.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import ua.kiev.dans.model.CustomUser;
import ua.kiev.dans.model.UserRole;
import ua.kiev.dans.repository.CustomUserRepository;
import java.io.File;
import java.sql.Date;
import java.util.List;


@Service
public class CustomUserServiceImp implements CustomUserService {
    @Autowired
    private CustomUserRepository userRepository;

    @Autowired
    @Qualifier("getMailSender")
    private JavaMailSender mailSender;

    @Override
    @Transactional(readOnly = true)
    public CustomUser getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    @Transactional
    public void updateUser(CustomUser customUser) {
        userRepository.save(customUser);
    }

    @Override
    @Transactional
    public void getByEmailAndUpdate(String email, String firstName, String lastName,
                                    String birthday, String phone) {
        CustomUser user = userRepository.findByEmail(email);
        user.setBirthDate(Date.valueOf(birthday));
        user.setFirstName(firstName);
        user.setSurname(lastName);
        user.setPhone(phone);
        userRepository.save(user);
    }

    @Override
    @Transactional
    public String addUserIfNotExists(String email, String login, String password, long maxMemory, Model model) {
        if(userRepository.existByEmailOrLogin(email, login)) {
            model.addAttribute("exists", true);
            model.addAttribute("email", email);
            model.addAttribute("login", login);
            return "register";
        }

        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        String passHash = encoder.encodePassword(password, null);
        File folder = new File("/var/www/nebessa/nebessa.net.ua/Storage/" + email);
        folder.mkdir();
        CustomUser customUser = new CustomUser(email, login, passHash, maxMemory, UserRole.USER, folder.getPath());
        userRepository.save(customUser);
        sendSimpleMessage(email, login);

        return "redirect:/";
    }

    @Override
    @Transactional(readOnly = true)
    public List<CustomUser> getAllUsers(Pageable pageable) {
        return userRepository.getAllUsers(pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public long countAll() {
        return userRepository.count();
    }

    @Override
    @Transactional
    public void deleteUser(long[] id) {
        for(long i : id)
            userRepository.delete(i);
    }

    private void sendSimpleMessage(String to, String login) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("info@nebessa.net.ua");
        message.setTo(to);
        message.setSubject("Registrations www.nebessa.net.ua");
        String text = String.format("Hello, %s!!!\nYou registered at nebessa.net.ua.\nHAVE FUN:)\n\nBest regards nebessa.net.ua", login);
        message.setText(text);
        mailSender.send(message);
    }
}
