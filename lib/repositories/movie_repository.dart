import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {



  List<Movie> getMovies() {
    return [
      Movie(
        id: 'backrooms',
        title: 'Backrooms',
        releaseYear: 2026,
        ageRating: '15',
        description: 'A strange doorway appears in the basement of a furniture showroom, leading to an endless network of interconnected rooms where time bends and the only thing scarier than getting lost is the sense that something is lying in wait.',
        price: 7.50,
        imagePath: 'assets/images/backrooms2026_poster.png',
        screening: 'Wednesday 07 Oct 2026'
      ),
      Movie(
        id: 'mission_impossible_rogue_nation',
        title: 'Mission Impossible: Rogue Nation',
        releaseYear: 2015,
        ageRating: '12A',
        description: 'After the closure of the Impossible Missions Force, its agent Ethan Hunt tries to avoid being captured by the CIA as he seeks to prove the existence of the Syndicate, a sophisticated terrorist outfit.',
        price: 7.50,
        imagePath: 'assets/images/mirn_poster.png',
        screening: 'Friday 09 Oct 2026'
      )
    ];
  }
}




