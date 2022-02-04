class Movie {
  final String movieName;
  final String movieImage;
  final String moviePrice;

  Movie(
      {required this.movieName,
      required this.movieImage,
      required this.moviePrice});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      movieName: json['movieName'],
      movieImage: json['movieImage'],
      moviePrice: json['moviePrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieName': movieName,
      'movieImage': movieImage,
      'moviePrice': moviePrice,
    };
  }
}
