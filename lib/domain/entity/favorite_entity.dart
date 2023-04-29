import 'package:json_annotation/json_annotation.dart';

part 'favorite_entity.g.dart';

@JsonSerializable()
class FavoriteEntity {
  int id;

  FavoriteEntity({required this.id});

  factory FavoriteEntity.fromJson(Map<String, dynamic> json) =>
      _$FavoriteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteEntityToJson(this);
}
