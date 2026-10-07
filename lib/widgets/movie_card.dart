import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(movie.imagePath,
                      width: 80, height: 120, fit: BoxFit.fill),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              color: cinemaBrand,
                              fontSize: 18,
                              fontWeight: FontWeight.bold

                            )
                          ),
                          Text(
                            movie.ageRating,
                            style: TextStyle(
                              color: cinemaFontMuted,
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                              
                            )
                          )

                        ]
                        ),
                        Text(
                          movie.description,
                          style: TextStyle(
                            color: cinemaFontWhite
                          )
                        )
                      ] 

                    )
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Tickets',
                  style: TextStyle(
                    color: cinemaBrand
                  )
                )
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.screening,
                    style: TextStyle(
                      color: cinemaFontMuted
                    )
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cinemaBackground
                    ),
                    onPressed: () {},
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: cinemaFontWhite
                      )
                    )
                  )
                ]
              )
            ],
          ),
        ));
  }
}
