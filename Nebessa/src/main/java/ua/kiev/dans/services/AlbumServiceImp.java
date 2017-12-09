package ua.kiev.dans.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.kiev.dans.model.Album;
import ua.kiev.dans.repository.AlbumRepository;
import java.util.List;

@Service
public class AlbumServiceImp implements AlbumService {

    @Autowired
    private AlbumRepository albumRepository;

    @Override
    @Transactional
    public void addAlbum(Album album) {
        albumRepository.save(album);
    }

    @Override
    @Transactional(readOnly = true)
    public Album getAlbumById(long id) {
        return albumRepository.getAlbumById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public long countAlbumByUserId(long id) {
        return albumRepository.countAlbumByUserId(id);
    }

    @Override
    @Transactional(readOnly = true)
    public long countAllAlbums() {
        return albumRepository.count();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Album> findAll() {
        return albumRepository.findAll();
    }

    @Override
    @Transactional
    public void delAlbum(long id) {
        albumRepository.delete(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Album> getAllAlbum(long userId, Pageable pageable) {
        return albumRepository.getAllAlbum(userId, pageable);
    }



}
