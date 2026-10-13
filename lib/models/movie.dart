class Movie {
  final String id;
  final String title;
  final int releaseYear;
  final String ageRating;
  final String description;
  final double price;
  final String imagePath;
  final String screening;

  Movie(
      {required this.id,
      required this.title,
      required this.releaseYear,
      required this.ageRating,
      required this.description,
      required this.price,
      required this.imagePath,
      required this.screening});

  String get formattedPrice {
    final String formattedValue = price.toStringAsFixed(2);
    return '£$formattedValue';
  }

  bool get isChildFriendly {
    if (ageRating == 'PG' || ageRating == 'U') {
      return true;
    } else {
      return false;
    }
  }

  bool get isAdultOnly {
    if (ageRating == '18') {
      return true;
    } else {
      return false;
    }
  }
}
