package ua.kiev.dans.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.kiev.dans.repository.GroupRepository;

@Service
public class GroupServiceImp implements GroupService {

    @Autowired
    GroupRepository groupRepository;


}
