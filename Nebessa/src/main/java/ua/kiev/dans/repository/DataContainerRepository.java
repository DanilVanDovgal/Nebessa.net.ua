package ua.kiev.dans.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.kiev.dans.model.DataContainer;
import java.util.List;

public interface DataContainerRepository extends JpaRepository<DataContainer, Long> {

    List<DataContainer> getAllByAlbum_Id(long albumId, Pageable pageable);

    DataContainer getDataContainerById(long photoId);

    void deleteDataContainerById(long photoId);

    long countAllByAlbum_Id(long albumId);

    @Query("SELECT SUM(d.size) FROM DataContainer d")
    Long sumSize();

    @Query("SELECT SUM(d.size) FROM DataContainer d WHERE album_id = :id")
    Long sumSizeByAlbumId(@Param("id") long id);
}
