import 'package:ai_movie_app/core/models/movie_model.dart';

class WishlistItem {
  final String id;
  final MovieModel movie;
  final DateTime addedAt;
  final String userId;

  WishlistItem({
    required this.id,
    required this.movie,
    required this.addedAt,
    required this.userId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WishlistItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'WishlistItem(id: $id, movie: ${movie.title}, addedAt: $addedAt)';
  }
}
