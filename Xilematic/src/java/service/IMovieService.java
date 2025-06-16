/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.time.LocalDateTime;
import java.util.List;
import model.Movie;

/**
 *
 * @author ADMIN
 */
public interface IMovieService {

    public void insertMovie(Movie movie);

    public Movie getMovie(int id);

    public List<Movie> getAllMovies();

    public boolean deleteMovie(int id);

    public boolean updateMovie(Movie Movie);

    public List<Movie> getMoviesForPage(int currentPage, int pageSize);

    public int getTotalMoviesCount();

    public String getMovieShowtimeByCinema(int ma_rap, int ma_phim);
}
