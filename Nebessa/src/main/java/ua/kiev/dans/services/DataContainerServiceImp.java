package ua.kiev.dans.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.kiev.dans.model.DataContainer;
import ua.kiev.dans.repository.DataContainerRepository;
import java.util.List;

@Service
public class DataContainerServiceImp implements DataContainerService {

    @Autowired
    DataContainerRepository dataRepository;

    @Override
    @Transactional
    public void addPhoto(DataContainer data) {
        dataRepository.save(data);
    }

    @Override
    @Transactional
    public void deleteDataContainerById(long photoId) {
        dataRepository.deleteDataContainerById(photoId);
    }

    @Override
    @Transactional(readOnly = true)
    public long countAllByAlbum_Id(long albumId) {
        return dataRepository.countAllByAlbum_Id(albumId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<DataContainer> getAllByAlbum_Id(long albumId, Pageable pageable) {
        return dataRepository.getAllByAlbum_Id(albumId, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Long sumSize() {
        Long size = dataRepository.sumSize();
        return size == null ? 0 : size;
    }

    @Override
    @Transactional(readOnly = true)
    public Long sumSizeByAlbumId(long albumId) {
        Long size = dataRepository.sumSizeByAlbumId(albumId);
        return size == null ? 0 : size;
    }

    @Override
    @Transactional(readOnly = true)
    public DataContainer getDataContainerById(long photoId) {
        return dataRepository.getDataContainerById(photoId);
    }
}
