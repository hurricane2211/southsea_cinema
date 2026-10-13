import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';


void main () {
  group('Movie Model Tests', () {
    test('Create Movie Instance', () {
      Movie movie = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: 'PG',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'

        
      );

      expect(movie.id, 'movie_1');
      expect(movie.title, 'testmovie');
      expect(movie.releaseYear, 2026);
      expect(movie.ageRating, 'PG');
      expect(movie.description, 'This is a test of the Movie Model');
      expect(movie.price, 7.501);
      expect(movie.imagePath, 'assets/images/backrooms2026_poster.png');
      expect(movie.screening, 'Monday 18th Oct 2032 @ 15:00');
    });

    test('formattedPrice returns Formatted Price',(){
      Movie movie = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: 'PG',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'
      );

      expect(movie.formattedPrice, '£7.50');

    });


    test('IsChildFriendly returns the correct result for older movies', () {
      Movie movie = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: '15',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'

      );

      Movie movie_2 = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: '12',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'
      );

      Movie movie_3 = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: 'PG',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'
      );

      Movie movie_4 = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: 'U',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'
      );

      expect(movie.isChildFriendly, false);
      expect(movie_2.isChildFriendly, false);
      expect(movie_3.isChildFriendly, true);
      expect(movie_4.isChildFriendly, true);

    });


    test('IsAdultOnly Correctly flags only 18 movies', () {
    Movie movie = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: '18',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'

      );

      Movie movie2 = Movie(
        id: 'movie_1',
        title: 'testmovie',
        releaseYear: 2026,
        ageRating: '15',
        description: 'This is a test of the Movie Model',
        price: 7.501,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Monday 18th Oct 2032 @ 15:00'
      );
      
      expect(movie.isAdultOnly, true);
      expect(movie2.isAdultOnly, false);
      });
  });
}


