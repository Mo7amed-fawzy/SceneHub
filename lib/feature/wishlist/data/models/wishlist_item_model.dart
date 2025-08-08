import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_item.dart';

class WishlistItemModel extends WishlistItem {
  WishlistItemModel({
    required super.id,
    required super.movie,
    required super.addedAt,
    required super.userId,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) {
    return WishlistItemModel(
      id: json['id'] ?? '',
      movie: MovieModel.fromJson(json['movie'] ?? {}),
      addedAt: DateTime.parse(
        json['added_at'] ?? DateTime.now().toIso8601String(),
      ),
      userId: json['user_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'movie': movie.toJson(),
      'added_at': addedAt.toIso8601String(),
      'user_id': userId,
    };
  }

  factory WishlistItemModel.fromEntity(WishlistItem entity) {
    return WishlistItemModel(
      id: entity.id,
      movie: entity.movie,
      addedAt: entity.addedAt,
      userId: entity.userId,
    );
  }
}
