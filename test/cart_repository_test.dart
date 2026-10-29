import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';


Movie testMovie1 = Movie(
  id: 'testmovie1',
  title: 'testmovie1', 
  releaseYear: 2021, 
  ageRating: 'PG',
  description: 'A TEST MOVIE FOR THE USE IN TESTS',
  price: 7.50, 
  imagePath: 'assets/images/mirn_poster.png',
  screening: 'Tuesday 14th OCT @ 10'
);


Movie testMovie2 = Movie(
  id: 'testmovie2',
  title: 'testmovie2', 
  releaseYear: 2021, 
  ageRating: '15',
  description: 'A TEST MOVIE FOR THE USE IN TESTS',
  price: 10.00, 
  imagePath: 'assets/images/mirn_poster.png',
  screening: 'Tuesday 14th OCT @ 10'
);


void main() {
  setUp(() {
    CartRepository.instance.clear();
  });


  group('Cart repository tests', () {
    test('Begins as an empty cart', () {
      CartRepository cart = CartRepository.instance;
      expect(cart.getContents().length, 0);
      expect(cart.getTotalItems(), 0);
      expect(cart.totalItemCount, 0);
      expect(cart.getTotalPrice(), 0.00);
    });

    test('Adding Items updates the correct variables and function calls', () {
      final CartRepository cart = CartRepository.instance;
      CartItem item1 = CartItem(movie: testMovie1, quantity: 1);
      CartItem item2 = CartItem(movie: testMovie2, quantity: 2); //27.50

      cart.addItem(item1);
      cart.addItem(item2);


      expect(cart.getContents().length, 2); 
      expect(cart.getTotalItems(), 3);
      expect(cart.totalItemCount, 3);
      expect(cart.getTotalPrice(), 27.50);
    });


    test('Correctly Removes Items from Basket', () {
      final CartRepository cart = CartRepository.instance;
      CartItem item = CartItem(movie: testMovie1, quantity: 1);
      
      cart.addItem(item);
      expect(cart.getContents().length, 1);
      
      cart.removeItem(0);
      expect(cart.getContents().length, 0);
      expect(cart.getTotalPrice(), 0.00);

    });



  });
  
  
} 