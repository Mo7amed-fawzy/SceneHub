class TvCastEntity {
  final List<CastEntity>? cast;

  const TvCastEntity({this.cast});
}

class CastEntity {
  final String? name;
  final String? profilePath;
  final List<RoleEntity>? roles;

  const CastEntity({this.name, this.profilePath, this.roles});
}

class RoleEntity {
  final String? character;

  const RoleEntity({this.character});
}
