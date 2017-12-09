package ua.kiev.dans.services;

import org.springframework.data.domain.Pageable;
import ua.kiev.dans.model.Album;
import java.util.List;

public interface AlbumService {
    void addAlbum(Album album);
    void delAlbum(long id);
    List<Album> getAllAlbum(long userId, Pageable pageable);
    Album getAlbumById(long id);
    long countAlbumByUserId(long id);
    long countAllAlbums();
    List<Album> findAll();
}
