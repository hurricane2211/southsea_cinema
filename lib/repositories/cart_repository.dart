
import 'package:southsea_cinema/models/cart_item.dart';

class CartRepository {
  CartRepository._internal();


 static final CartRepository instance = CartRepository._internal();


 final List<CartItem> _items = [];

 List<CartItem> getContents() {
  return List<CartItem>.unmodifiable(_items);
 }

 void addItem(CartItem item) {
  _items.add(item);
 }

 void removeItem(int index) {
  if (index >= 0 && index < _items.length) {
    _items.removeAt(index);
  }
 }

 int getTotalItems() {
  int total = 0;
  for (CartItem item in _items) {
    total += item.quantity;
  }
  return total; 
 }

 int get totalItemCount {
  return getTotalItems();
 }

 double getTotalPrice() {
  double total = 0.00;
  for (CartItem item in _items) {
    total += item.lineTotal;
  }

  return total;
 }

 void clear() {
  _items.clear();
 }



}