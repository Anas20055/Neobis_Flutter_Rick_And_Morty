import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';

part 'results.g.dart';

@JsonSerializable()
class ResultsModel extends ResultsEntity {
  const ResultsModel({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    CharacterLocation? origin,
    CharacterLocation? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) : super(
          id,
          name,
          status,
          species,
          type,
          gender,
          origin,
          location,
          image,
          episode,
          url,
          created,
        );

  factory ResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsModelToJson(this);
}
