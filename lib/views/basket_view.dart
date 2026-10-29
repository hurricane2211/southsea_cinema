import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() {
    return _BasketViewState();
  }
}

class _BasketViewState extends State<BasketView> {
  String _confirmationMessage = '';

  Widget _buildEmptyState() {
    return Center(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Text('Basket is Empty',
                style: TextStyle(color: cinemaFontWhite))));
  }

  @override
  Widget build(BuildContext context) {
    CartRepository cart = CartRepository.instance;
    List<CartItem> items = cart.getContents();

    Widget content;
    if (items.isEmpty) {
      if (_confirmationMessage.isNotEmpty) {
        content = Column(children: [
          _buildEmptyState(),
          Text(_confirmationMessage,
              style: TextStyle(
                  color: cinemaFontMuted, fontWeight: FontWeight.bold))
        ]);
      } else {
        content = _buildEmptyState();
      }
    } else {
      content = Text('Basket List Placeholder');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle, style: cinemaHeaderStyle),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0), child: content));
  }
}
