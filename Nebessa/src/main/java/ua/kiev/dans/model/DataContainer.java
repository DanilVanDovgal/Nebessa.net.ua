package ua.kiev.dans.model;

import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Entity
@NoArgsConstructor
public class DataContainer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fileName;
    private long size;
    private String path;

    @ManyToOne
    @JoinColumn(name = "album_id")
    private Album album;

    public DataContainer(String fileName, String path, Album album, long size) {
        this.fileName = fileName;
        this.path = path;
        this.album = album;
        this.size = size;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public byte[] getData() throws IOException {
        return Files.readAllBytes(new File(path).toPath());
    }
}
