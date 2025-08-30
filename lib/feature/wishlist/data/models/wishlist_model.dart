import 'package:hive/hive.dart';
import '../../domain/entities/wishlist_entity.dart';
part 'wishlist_model.g.dart';

@HiveType(typeId: 0)
class WishlistModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final String userId;

  @HiveField(4)
  final DateTime addedAt;

  WishlistModel({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.userId,
    required this.addedAt,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
    id: json['id'].toString(),
    name: json['name'],
    posterPath: json['posterPath'],
    userId: json['userId'] ?? 'guest',
    addedAt: DateTime.parse(json['addedAt']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'posterPath': posterPath,
    'userId': userId,
    'addedAt': addedAt.toIso8601String(),
  };

  factory WishlistModel.fromEntity(
    WishlistEntity entity, {
    String userId = 'guest',
  }) => WishlistModel(
    id: entity.id,
    name: entity.name,
    posterPath: entity.posterPath,
    userId: userId,
    addedAt: entity.addedAt,
  );

  WishlistEntity toEntity() => WishlistEntity(
    id: id,
    name: name,
    posterPath: posterPath,
    addedAt: addedAt,
  );
}
