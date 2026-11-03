import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

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
            padding: EdgeInsets.symmetric(vertical: 64.0),
            child: Text('Basket is Empty...',
                style: TextStyle(color: cinemaFontMuted))));
  }

  Widget _buildItem(CartRepository cart, CartItem item, int index) {
    return ColoredBox(
      color: const Color.fromARGB(255, 40, 41, 47),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(item.movie.title,
                            style: TextStyle(
                                color: cinemaBrand,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: 20),
                      Text('${item.quantity} Ticket(s)',
                          style: TextStyle(color: cinemaFontMuted))
                    ],
                  ),
                  Text('£${item.lineTotal.toStringAsFixed(2)}'),
                ])),
            IconButton(
                icon: Icon(Icons.delete_outline, color: cinemaFontWhite),
                onPressed: () {
                  setState(() {
                    cart.removeItem(index);
                  });
                })
          ])),
    );
  }

  Widget _buildHelperRow(String label, String value, Color color,
      {bool emphasise = true}) {
    TextStyle style;
    if (emphasise) {
      style =
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20);
    } else {
      style = TextStyle(color: color, fontSize: 15);
    }

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(label, style: style), Text(value, style: style)]));
  }

  Widget _buildBasketContents(CartRepository cart, List<CartItem> items) {
    List<Widget> contents = [];

    contents.add(Text('Basket', style: cinemaHeaderStyle));
    contents.add(SizedBox(height: 20));
    contents.add(Text('Items',
        style: TextStyle(
            color: cinemaFontMuted,
            fontSize: 15,
            decoration: TextDecoration.underline)));
    contents.add(SizedBox(height: 20));

    for (int index = 0; index < items.length; index++) {
      contents.add(_buildItem(cart, items[index], index));
      contents.add(SizedBox(height: 10));
    }

    contents.add(SizedBox(height: 20));

    contents
        .add(_buildHelperRow('Service Charge', '£${4.00}', cinemaFontMuted));

    contents.add(_buildHelperRow('Total Due',
        '£${(cart.getTotalPrice() + 4.00).toStringAsFixed(2)}', cinemaFontWhite,
        emphasise: true));

    contents.add(SizedBox(height: 24));

    contents.add(SizedBox(
        width: double.infinity,
        child: PrimaryButton(
            label: 'Checkout',
            onPressed: () {
              setState(() {
                cart.clear();
                _confirmationMessage = 'Order Confirmed!';
              });
            })));

    if (_confirmationMessage.isNotEmpty) {
      contents.add(SizedBox(height: 5));
      contents.add(
          Text(_confirmationMessage, style: TextStyle(color: cinemaFontMuted)));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contents,
    );
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
      content = _buildBasketContents(cart, items);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle, style: cinemaHeaderStyle),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0), child: content));
  }
}
