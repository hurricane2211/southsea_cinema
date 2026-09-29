import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MovieListingState();
  }
}


class _MovieListingState extends State<MovieListing> {
  int _totaltickets = 1;


  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
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
            Text('Backrooms (2026) (15)',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,)),
            SizedBox(height: 40),
            Text('A strange doorway appears in the basement of a furniture showroom, leading to an endless network of interconnected rooms where time bends and the only thing scarier than getting lost is the sense that something is lying in wait.',
                  style: TextStyle(
                    color: cinemaFontWhite

                  )),
            SizedBox(height: 30),
            Text('Southsea Cinema Room',
                  style: TextStyle(
                    color: cinemaFontMuted)),
            SizedBox(height: 5),
            Text('Thursday 22 Oct 2026  18:00 ',
                  style: TextStyle(
                    color: cinemaFontMuted)
                ),
            SizedBox(height: 40),
            Text('Please note that Discounts / Membership Benefits will be applied once you have selected your tickets',
                  style: TextStyle(
                    color: cinemaFontMuted)),
            SizedBox(height: 5),
            Text('Select Quantities (Up to 5 in total)',
                  style: TextStyle(
                    color: cinemaFontMuted)),
            SizedBox(height: 30),
            Text('Tickets',
            style: TextStyle(
              color: cinemaFontWhite,
              fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 15),
            Row(
              children: [
                DropdownMenu<int>(
                initialSelection: 1,
                onSelected: (int? value) {
                  if (value !=null) {
                    setState(() {_totaltickets = value;}); 
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
                Text('Adult (£7.50)')
                ]
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: cinemaBrandDark,
                foregroundColor: cinemaBackground
              ),
              onPressed: () => print('$_totaltickets Ticket(s) added to order'), 
              child: Text('Add to Order'))
          ],
        )
      )
    );
  }
}

