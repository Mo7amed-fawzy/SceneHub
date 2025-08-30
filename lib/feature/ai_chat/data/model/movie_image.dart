class MovieImage {
  final int id;
  final String title;
  final String imageUrl;

  MovieImage({required this.id, required this.title, required this.imageUrl});

  factory MovieImage.fromJson(Map<String, dynamic> json) {
    return MovieImage(
      id: json['id'] ?? 0,
      title: json['title'] ?? "Unknown",
      imageUrl: json['poster_path'] != null
          ? "https://image.tmdb.org/t/p/w500${json['poster_path']}"
          : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "poster_path": imageUrl};
  }
}
