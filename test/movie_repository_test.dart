import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';


void main () {
  group('Movie Repository Unit Tests', () {
    test('getMovies returns two movies', () {
      MovieRepository repo = MovieRepository();
      List<Movie> movies  = repo.getMovies();

      expect(movies.length, 2);

    });

    test('Movies have Unique Ids', () {

      MovieRepository repo = MovieRepository();
      List<Movie> movies = repo.getMovies();

      Set<String> uniqueIds = {};
      for (final movie in repo.getMovies()) {
        uniqueIds.add(movie.id);
      }
      
      expect(uniqueIds.length, movies.length);
    });

    test('getMovies contains valid information for movies',(){
      MovieRepository repo = MovieRepository();
      List<Movie> movies = repo.getMovies();

      for (final movie in movies) {
        expect(movie.id, isNotEmpty);
        expect(movie.title, isNotEmpty);
        expect(movie.ageRating, isNotEmpty);
        expect(movie.price > 0, isTrue);
      }
    });


    test('getMoviedById successfully returns correct movie or null', () {

      MovieRepository repo = MovieRepository();
      Movie movie = repo.getMovieById('backrooms')!;
      Movie? movie1 = repo.getMovieById('random');

      expect(movie.title, 'Backrooms');
      expect(movie1, null);
    });

    test('getMoviesByAgeRating correctly returns only movies of the correct criteria', (){
      MovieRepository repo = MovieRepository();
      List<Movie>? moviesByAge = repo.getMoviesByAgeRating('15');
      List<Movie>? moviesByAge1 = repo.getMoviesByAgeRating('PG-13');
      List<Movie>? moviesByAge2 = repo.getMoviesByAgeRating('TEST');
      
      expect(moviesByAge, isNotNull);
      expect(moviesByAge1, isNotNull);

      if (moviesByAge != null) {
        for (Movie movie in moviesByAge) {
          expect(movie.ageRating, '15');
        }
      }

      if (moviesByAge1 != null) {
        for (Movie movie in moviesByAge1) {
          expect(movie.ageRating, 'PG-13');
        }
      }

      expect(moviesByAge2, null);
      


    });


    test('getMoviesUnderPrice returns the correct movies based on criteria', (){
      MovieRepository repo = MovieRepository();
      List<Movie>? movies = repo.getMoviesUnderPrice(7.60);
      List<Movie>? moviesNull = repo.getMoviesUnderPrice(1.01);

      expect(movies, isNotNull);
      expect(moviesNull, null);
      
      if (movies != null) {
        for (Movie movie in movies) {
          expect(movie.price <= 7.60, true);
        }
      }
    });
    


  });
}