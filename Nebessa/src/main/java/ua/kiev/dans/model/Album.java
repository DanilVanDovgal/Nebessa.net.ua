package ua.kiev.dans.model;

import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Entity
@NoArgsConstructor
public class Album {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private Date date;
    private String note;
    private String albumPath;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private CustomUser user;

    @OneToMany(mappedBy = "album", cascade = CascadeType.ALL)
    private List<DataContainer> fileList = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "group_id")
    private Group group;

    public Album(String name, Date date, String note, CustomUser user, String albumPath) {
        this.name = name;
        this.date = date;
        this.user = user;
        this.note = note;
        this.albumPath = albumPath;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public CustomUser getUser() {
        return user;
    }

    public void setUser(CustomUser user) {
        this.user = user;
    }

    public List<DataContainer> getFileList() {
        return Collections.unmodifiableList(fileList);
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public String getAlbumPath() {
        return albumPath;
    }

    public void setAlbumPath(String albumPath) {
        this.albumPath = albumPath;
    }
}
