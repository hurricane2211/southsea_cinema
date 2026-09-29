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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Backrooms (2026)'),
            Text('A strange doorway appears in the basement of a furniture showroom, leading to an endless network of interconnected rooms where time bends and the only thing scarier than getting lost is the sense that something is lying in wait.'),
            Text('Southsea Cinema Room'),
            Text('Thursday 22 Oct 2026  18:00 '),
            Text('Please note that Discounts / Membership Benefits will be applied once you have selected your tickets'),
            Text('Select Quantities (Up to 5 in total)'),
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
                Text('Adult (£7.50)')
                ]
            ),
            ElevatedButton(onPressed: () => print('$_totaltickets Ticket(s) added to order'), child: Text('Add to Order'))
          ],
        )
      )
    );
  }
}

