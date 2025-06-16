/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Movie;
import dao.MovieDAO;

/**
 *
 * @author ADMIN
 */
public class MovieServiceImpl implements IMovieService {

    private MovieDAO movieDao = new MovieDAO();

    @Override
    public void insertMovie(Movie movie) {
        try {
            movieDao.insertMovie(movie);
        } catch (SQLException ex) {
            Logger.getLogger(MovieServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Movie getMovie(int id) {
        try {
            return movieDao.selectMovie(id);
        } catch (SQLException ex) {
            Logger.getLogger(MovieServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Movie> getAllMovies() {
        try {
            movieDao.selectAllMovies();
        } catch (SQLException ex) {
            Logger.getLogger(MovieServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean deleteMovie(int id) {
        try {
            return movieDao.deleteMovie(id);
        } catch (SQLException ex) {
            Logger.getLogger(MovieServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean updateMovie(Movie movie) {
        try {
            movieDao.updateMovie(movie);
        } catch (SQLException ex) {
            Logger.getLogger(MovieServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<Movie> getMoviesForPage(int currentPage, int pageSize) {
        try {
            return movieDao.getMovieForPage(currentPage, pageSize);
        } catch (SQLException ex) {
            Logger.getLogger(MovieServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public int getTotalMoviesCount() {
        try {
            return movieDao.getTotalMoviesCount();
        } catch (SQLException ex) {
            Logger.getLogger(MovieServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

}
