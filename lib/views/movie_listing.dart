import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;
  const MovieListing({
    super.key,
    required this.movie
    });

  @override
  State<StatefulWidget> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _totaltickets = 1;
  String _orderMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Purchase Movie Tickets',
            style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.movie.title} ${widget.movie.ageRating}',
                    style: TextStyle(
                      color: cinemaBrand,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 40),
                SizedBox(
                    width: 1000,
                    child: Text(
                        widget.movie.description,
                        style: TextStyle(color: cinemaFontWhite))),
                SizedBox(height: 20),
                Text('Southsea Cinema Room',
                    style: TextStyle(color: cinemaFontMuted)),
                SizedBox(height: 5),
                Text('${widget.movie.screening} @ 18:00 ',
                    style: TextStyle(color: cinemaFontMuted)),
                SizedBox(height: 20),
                Text(
                    'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets',
                    style: TextStyle(color: cinemaFontMuted)),
                SizedBox(height: 5),
                Text('Select Quantities (Up to 5 in total)',
                    style: TextStyle(color: cinemaFontMuted)),
                SizedBox(height: 10),
                Text('Tickets',
                    style: TextStyle(
                        color: cinemaFontWhite, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Row(children: [
                  DropdownMenu<int>(
                      initialSelection: 1,
                      onSelected: (int? value) {
                        if (value != null) {
                          setState(() {
                            _totaltickets = value;
                          });
                        }
                      },
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: 1, label: '1'),
                        DropdownMenuEntry(value: 2, label: '2'),
                        DropdownMenuEntry(value: 3, label: '3'),
                        DropdownMenuEntry(value: 4, label: '4'),
                        DropdownMenuEntry(value: 5, label: '5')
                      ]),
                  SizedBox(width: 15),
                  Text('Adult (£${widget.movie.price})')
                ]),
                SizedBox(height: 5),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: cinemaBrandDark,
                        foregroundColor: cinemaBackground),
                    onPressed: () =>
                        setState(() {
                          _orderMessage = '$_totaltickets Ticket(s) added to order';
                          }),
                    child: Text('Add to Order')),


                SizedBox(height: 5),

                Text(
                  _orderMessage,
                  style: TextStyle(
                    color: cinemaFontWhite
                  ))

                  
              ],
            )));
  }
}
