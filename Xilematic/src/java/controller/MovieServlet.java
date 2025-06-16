
package controller;

import constant.PageLink;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Movie;
import service.IMovieService;
import service.MovieService;


@WebServlet(name = "MovieServlet", urlPatterns = {"/movies"})
public class MovieServlet extends HttpServlet {

    private final IMovieService movieService = new MovieService();

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
            case "update":
                processUpdate(request, response);
                break;
            case "delete":
                processDelete(request, response);
                break;
            default:
                break;
        }
    }

    //process add function
    private void processAddMovie(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String trailer = request.getParameter("trailer");
        String image = request.getParameter("image"); // Đã là link URL
        String description = request.getParameter("description");
        String releaseDateStr = request.getParameter("releaseDate");
        String rateStr = request.getParameter("rate");
        String status = request.getParameter("status");
        String hot = request.getParameter("hot"); // Checkbox: có thì "true", không thì null
        String actor = request.getParameter("actor");
        String director = request.getParameter("director");

        // Xử lý đánh giá
        int rate = Integer.parseInt(rateStr);

        // Xử lý hot
        boolean isHot = hot != null;

        boolean sts = "true".equals(status);

        movieService.insertMovie(new Movie(title, trailer, image, description, releaseDateStr, rate, isHot, sts, actor, director));
        response.sendRedirect("paging?type=movies");
    }

    private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String trailer = request.getParameter("trailer");
        String image = request.getParameter("image"); // Đã là link URL
        String description = request.getParameter("description");
        String releaseDateStr = request.getParameter("releaseDate");
        String rateStr = request.getParameter("rate");
        String status = request.getParameter("status");
        String hot = request.getParameter("hot"); // Checkbox: có thì "true", không thì null
        String actor = request.getParameter("actor");
        String director = request.getParameter("director");
        int rate = Integer.parseInt(rateStr);

        // Xử lý hot
        boolean isHot = hot != null;

        boolean sts = "true".equals(status);
        movieService.updateMovie(new Movie(Integer.parseInt(id), title, trailer, image, description, releaseDateStr, rate, isHot, sts, actor, director));
        response.sendRedirect("paging?type=movies");
    }

    private void processDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        movieService.deleteMovie(Integer.parseInt(id));
        response.sendRedirect("paging?type=movies");
    }

    private void processShowDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Movie mv = movieService.getMovie(Integer.parseInt(id));
        request.setAttribute("movie", mv);
        request.getRequestDispatcher(PageLink.DETAIL_PAGE).forward(request, response);

    }

}
