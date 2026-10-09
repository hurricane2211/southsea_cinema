import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1000) {
        return Card(
            color: cinemaSurface,
            margin: EdgeInsets.only(right: 900, left: 16, top: 8, bottom: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(movie.imagePath,
                          width: 150, height: 225, fit: BoxFit.fill),
                      SizedBox(width: 30),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(movie.title,
                                      style: TextStyle(
                                          color: cinemaBrand,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 15),
                                  Text(movie.ageRating,
                                      style: TextStyle(
                                          color: cinemaFontMuted,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                            SizedBox(height: 30),
                            Text(movie.description,
                                style: TextStyle(
                                  color: cinemaFontWhite,
                                  fontSize: 15)
                                )
                          ]))
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Tickets', style: TextStyle(color: cinemaBrand))
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(movie.screening,
                              style: TextStyle(color: cinemaFontMuted)),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: cinemaBackground),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MovieListing(movie: movie);
                                  }
                                )

                              );
                            },
                            child: Text('Book Now',
                                style: TextStyle(color: cinemaFontWhite)))
                      ])
                ],
              ),
            ));
      } else {
        return Card(
            color: cinemaSurface,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(movie.imagePath,
                          width: 150, height: 225, fit: BoxFit.fill),
                      SizedBox(width: 30),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(movie.title,
                                          style: TextStyle(
                                              color: cinemaBrand,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))),
                                  Text(movie.ageRating,
                                      style: TextStyle(
                                          color: cinemaFontMuted,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))
                                ]),
                            SizedBox(height: 15),
                            Text(movie.description,
                                style: TextStyle(
                                  color: cinemaFontWhite,
                                  fontSize: 11))
                          ]))
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Tickets', style: TextStyle(color: cinemaBrand))
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(movie.screening,
                              style: TextStyle(color: cinemaFontMuted)),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: cinemaBackground),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MovieListing(movie: movie);
                                  }
                                )

                              );
                            },
                            child: Text('Book Now',
                                style: TextStyle(color: cinemaFontWhite)))
                      ])
                ],
              ),
            ));
      }
    });
  }
}
