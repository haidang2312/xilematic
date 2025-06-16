/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Movie;
import movieService.IMovieService;
import movieService.MovieServiceImpl;

@WebServlet(name = "MovieServlet", urlPatterns = {"/movies"})
public class MovieServlet extends HttpServlet {

    private final IMovieService movieService = new MovieServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        switch (action) {
            case "showDetail":
                processShowDetail(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        switch (action) {
            case "add":
                processAddMovie(request, response);
                break;
            default:
                break;
        }
    }

    //process add function
    private void processAddMovie(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movieName = request.getParameter("movieName");
        String trailer = request.getParameter("trailer");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String releaseDate = request.getParameter("releaseDate");
        String rate = request.getParameter("rate");
        String hot = request.getParameter("hot");
        String status = request.getParameter("status");
        String actor = request.getParameter("actor");
        String director = request.getParameter("director");

        boolean isHot = hot.equals("1");
        boolean isShowing = status.equals("1");

        movieService.insertMovie(new Movie(movieName, trailer, image, description, releaseDate, Integer.parseInt(rate), isHot, isShowing, actor, director));
        response.sendRedirect("paging?type=movies");
    }

//    movie?action=showDetail&id=1
    //show detail
    private void processShowDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Movie mv = movieService.getMovie(Integer.parseInt(id));
    }

}
