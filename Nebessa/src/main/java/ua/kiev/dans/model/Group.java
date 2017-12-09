package ua.kiev.dans.model;

import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Entity
@Table(name = "Groups")
@NoArgsConstructor
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToMany(mappedBy = "groupList", cascade = CascadeType.ALL)
    private List<CustomUser> usersList = new ArrayList<>();

    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL)
    private List<Album> groupAlbumList = new ArrayList<>();

    public Group(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<CustomUser> getUsersList() {
        return Collections.unmodifiableList(usersList);
    }

    public List<Album> getGroupAlbumList() {
        return Collections.unmodifiableList(groupAlbumList);
    }
}
