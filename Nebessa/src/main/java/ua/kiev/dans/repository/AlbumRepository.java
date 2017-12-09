package ua.kiev.dans.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.kiev.dans.model.Album;
import java.util.List;

public interface AlbumRepository extends JpaRepository<Album, Long> {

    @Query("SELECT a FROM Album a WHERE user_id = :id")
    List<Album> getAllAlbum(@Param("id") long id, Pageable pageable);

    Album getAlbumById(long id);

    @Query("SELECT COUNT(a) FROM Album a WHERE user_id = :id")
    long countAlbumByUserId(@Param("id") long id);

    long count();

    List<Album> findAll();

}
