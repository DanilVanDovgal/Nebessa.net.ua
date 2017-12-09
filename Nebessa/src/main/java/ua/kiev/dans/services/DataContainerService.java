package ua.kiev.dans.services;

import org.springframework.data.domain.Pageable;
import ua.kiev.dans.model.DataContainer;
import java.util.List;

public interface DataContainerService {
    void addPhoto(DataContainer data);
    DataContainer getDataContainerById(long photoId);
    void deleteDataContainerById(long photoId);
    long countAllByAlbum_Id(long albumId);
    List<DataContainer> getAllByAlbum_Id(long albumId, Pageable pageable);
    Long sumSize();
    Long sumSizeByAlbumId(long albumId);
}
