enum WishlistItemType { movie, tvSeries }

class WishlistEntity {
  final String id;
  final String name;
  final String posterPath;
  final DateTime addedAt;

  WishlistEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.addedAt,
  });
}
