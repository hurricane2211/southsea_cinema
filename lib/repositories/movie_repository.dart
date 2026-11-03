import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }
    return [
      Movie(
          id: 'backrooms',
          title: 'Backrooms',
          releaseYear: 2026,
          ageRating: '15',
          description:
              'A strange doorway appears in the basement of a furniture showroom, leading to an endless network of interconnected rooms where time bends and the only thing scarier than getting lost is the sense that something is lying in wait.',
          price: 7.50,
          imagePath: 'assets/images/backrooms2026_poster.png',
          screening: 'Wednesday 07 Oct 2026'),
      Movie(
          id: 'mission_impossible_rogue_nation',
          title: 'Mission Impossible: Rogue Nation',
          releaseYear: 2015,
          ageRating: 'PG-13',
          description:
              'After the closure of the Impossible Missions Force, agent Ethan Hunt (Tom Cruise) seeks to prove the existence of the Syndicate, a sophisticated terrorist outfit, all whilst being hunted by the CIA.',
          price: 7.50,
          imagePath: 'assets/images/mirn_poster.png',
          screening: 'Friday 09 Oct 2026')
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset(
      {String assetPath = 'assets/data/movies.json'}) async {
    String jsonString = await rootBundle.loadString(assetPath);
    dynamic decodedData = jsonDecode(jsonString);
    List<dynamic> jsonList = decodedData as List<dynamic>;
    List<Movie> loadedMovies = [];

    for (dynamic item in jsonList) {
      Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }

  List<Movie>? getMoviesByAgeRating(String rating) {
    List<Movie> movies = [];
    for (final movie in getMovies()) {
      if (movie.ageRating == rating) {
        movies.add(movie);
      }
    }
    if (movies.isEmpty) {
      return null;
    }
    return movies;
  }

  List<Movie>? getMoviesUnderPrice(double maxPrice) {
    List<Movie> movies = [];
    for (final movie in getMovies()) {
      if (movie.price <= maxPrice) {
        movies.add(movie);
      }
    }
    if (movies.isEmpty) {
      return null;
    }
    return movies;
  }
}
