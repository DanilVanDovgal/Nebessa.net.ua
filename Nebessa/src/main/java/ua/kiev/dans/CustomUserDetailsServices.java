package ua.kiev.dans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ua.kiev.dans.model.CustomUser;
import ua.kiev.dans.services.CustomUserService;
import java.util.HashSet;
import java.util.Set;

@Service
public class CustomUserDetailsServices implements UserDetailsService {
    @Autowired
    private CustomUserService customUserService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        CustomUser customUser = customUserService.getUserByEmail(email);
        if(customUser == null)
            throw new UsernameNotFoundException(email + "email not found");

        Set<GrantedAuthority> roles = new HashSet<>();
        roles.add(new SimpleGrantedAuthority(customUser.getRole().toString()));
        return new User(customUser.getEmail(), customUser.getPassword(), roles);
    }
}
