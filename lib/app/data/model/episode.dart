import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/app/domain/entity/episode.dart';

part 'episode.g.dart';

@JsonSerializable()
class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    required super.name,
    required super.episode,
    required super.air_date,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
