import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: cinemaSurface,
        margin: EdgeInsets.only(right: 16, left: 16, top:8, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                              child: Text(
                                    movie.title,
                                    style: TextStyle(
                                      color: cinemaBrand,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold

                                    )
                                  )),
                              Text(
                                movie.ageRating,
                                style: TextStyle(
                                  color: cinemaFontMuted,
                                  fontSize: 18,
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
