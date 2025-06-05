/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
import java.time.LocalDate;

public class Movie {
    
    private int id;
    private String movieName;
    private String trailer;
    private String image;
    private String description;
    private LocalDate releaseDate;
    private int rate;
    private boolean hot;
    //1 - dang chieu
    //0 - sap chieu
    private boolean status;
    private String mainCharacter;
    private String director;
    
    public Movie() {
    }
    
    public Movie(int id, String movieName, String trailer, String image, String description, LocalDate releaseDate, int rate, boolean hot, boolean status, String mainCharacter, String director) {
        this.id = id;
        this.movieName = movieName;
        this.trailer = trailer;
        this.image = image;
        this.description = description;
        this.releaseDate = releaseDate;
        this.rate = rate;
        this.hot = hot;
        this.status = status;
        this.mainCharacter = mainCharacter;
        this.director = director;
    }
    
    public Movie(int id, String movieName, String trailer, String image, String description, String releaseDate, int rate, boolean hot, boolean status, String mainCharacter, String director) {
        this.id = id;
        this.movieName = movieName;
        this.trailer = trailer;
        this.image = image;
        this.description = description;
        this.releaseDate = LocalDate.parse(releaseDate);
        this.rate = rate;
        this.hot = hot;
        this.status = status;
        this.mainCharacter = mainCharacter;
        this.director = director;
    }
    
    public Movie(String movieName, String releaseDate) {
        this.movieName = movieName;
        this.releaseDate = LocalDate.parse(releaseDate);
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getMovieName() {
        return movieName;
    }
    
    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }
    
    public String getTrailer() {
        return trailer;
    }
    
    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }
    
    public String getImage() {
        return image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public LocalDate getReleaseDate() {
        return releaseDate;
    }
    
    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }
    
    public int getRate() {
        return rate;
    }
    
    public void setRate(int rate) {
        this.rate = rate;
    }
    
    public boolean isHot() {
        return hot;
    }
    
    public void setHot(boolean hot) {
        this.hot = hot;
    }
    
    public boolean isStatus() {
        return status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public String getMainCharacter() {
        return mainCharacter;
    }
    
    public void setMainCharacter(String mainCharacter) {
        this.mainCharacter = mainCharacter;
    }
    
    public String getDirector() {
        return director;
    }
    
    public void setDirector(String director) {
        this.director = director;
    }
    
    @Override
    public String toString() {
        return "Movie{" + "id=" + id + ", movieName=" + movieName + ", trailer=" + trailer + ", image=" + image + ", description=" + description + ", releaseDate=" + releaseDate + ", rate=" + rate + ", hot=" + hot + ", status=" + status + ", mainCharacter=" + mainCharacter + ", director=" + director + '}';
    }
    
}
