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


  factory Movie.fromJson(Map<String, dynamic> json) {
    String id = json['id'] as String;
    String title = json['title'] as String;
    int releaseYear = json['releaseYear'] as int;
    String ageRating = json['ageRating'] as String;
    String description = json['description'] as String;
    num priceNumber = json['price'] as num;
    double price = priceNumber.toDouble();
    String imagePath = json['imagePath'] as String;
    String screening = json['screening'] as String;


    return Movie(
      id: id,
      title: title,
      releaseYear: releaseYear,
      ageRating: ageRating,
      description: description,
      price: price,
      imagePath: imagePath,
      screening: screening
    );

  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic> {
      
      'id': id,
      'title': title,
      'releaseYear': releaseYear,
      'ageRating': ageRating,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'screening': screening

    };
    return data;

  }

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
