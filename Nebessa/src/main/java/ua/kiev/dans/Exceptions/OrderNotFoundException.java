package ua.kiev.dans.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "PAGE NOT FOUND")
public class OrderNotFoundException extends RuntimeException {
}
