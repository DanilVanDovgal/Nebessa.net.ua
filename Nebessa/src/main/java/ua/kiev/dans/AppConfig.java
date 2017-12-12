package ua.kiev.dans;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@PropertySource("classpath:config.properties")
@EnableTransactionManagement
@EnableWebMvc
public class AppConfig extends WebMvcConfigurerAdapter {
    @Value("${hibernate.dialect}")
    private String sqlDialect;

    @Value("${hbm2ddl.auto}")
    private String hbm2dllAuto;

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory
            (DataSource dataSource, JpaVendorAdapter jpaVendorAdapter)
    {
        LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
        entityManagerFactory.setDataSource(dataSource);
        entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter);
        entityManagerFactory.setJpaProperties(additionalProperties());
        entityManagerFactory.setPackagesToScan("ua.kiev.dans");
        return entityManagerFactory;
    }

    @Bean
    public PlatformTransactionManager transactionManager(EntityManagerFactory emf){
        return new JpaTransactionManager(emf);
    }

    @Bean
    public JpaVendorAdapter jpaVendorAdapter() {
        HibernateJpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
        adapter.setShowSql(true);
        adapter.setDatabasePlatform(sqlDialect);

        return adapter;
    }

    private Properties additionalProperties() {
        Properties properties = new Properties();
        properties.setProperty("hibernate.hbm2ddl.auto", hbm2dllAuto);
        return properties;
    }

    @Bean
    public UrlBasedViewResolver setupViewResolver() {
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();
        resolver.setPrefix("/WEB-INF/pages/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);

        return resolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler( "/static/**")
                .addResourceLocations("WEB-INF/static/");
        registry.addResourceHandler("/css/**")
                .addResourceLocations("WEB-INF/resource/css/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("WEB-INF/resource/js/");
        registry.addResourceHandler("/css_boot/**")
                .addResourceLocations("WEB-INF/resource/vendor/bootstrap/css_boot/");
        registry.addResourceHandler("/css_font/**")
                .addResourceLocations("WEB-INF/resource/vendor/font-awesome/css_font/");
        registry.addResourceHandler("/magnific-popup/**")
                .addResourceLocations("WEB-INF/resource/vendor/magnific-popup/");
        registry.addResourceHandler("/jquery/**")
                .addResourceLocations("WEB-INF/resource/vendor/jquery/");
        registry.addResourceHandler("/popper/**")
                .addResourceLocations("WEB-INF/resource/vendor/popper/");
        registry.addResourceHandler("/js_boot/**")
                .addResourceLocations("WEB-INF/resource/vendor/bootstrap/js_boot/");
        registry.addResourceHandler("/jquery-easing/**")
                .addResourceLocations("WEB-INF/resource/vendor/jquery-easing/");
        registry.addResourceHandler("/scrollreveal/**")
                .addResourceLocations("WEB-INF/resource/vendor/scrollreveal/");
        registry.addResourceHandler("/fonts/**")
                .addResourceLocations("WEB-INF/resource/vendor/font-awesome/fonts/");
        registry.addResourceHandler("/fancybox/**")
                .addResourceLocations("WEB-INF/resource/vendor/fancybox/");
        registry.addResourceHandler("/helpers/**")
                .addResourceLocations("WEB-INF/resource/vendor/fancybox/helpers/");

    }

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailsServices();
    }

    @Bean
    public JavaMailSender getMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("mx1.mirohost.net");
        mailSender.setPort(587);
        mailSender.setUsername("info@nebessa.net.ua");
        mailSender.setPassword("***********");

        Properties properties = mailSender.getJavaMailProperties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.debug", "true");

        return mailSender;
    }

}
