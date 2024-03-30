import 'package:rick_and_morty_app/app/data/model/info.dart';
import 'package:rick_and_morty_app/app/data/model/results.dart';
import 'package:rick_and_morty_app/app/domain/entity/character.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    InfoModel? info,
    List<ResultsModel>? results,
  }) : super(
          info,
          results,
        );
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      info: InfoModel.fromJson(json['info']),
      results: (json['results'] as List<dynamic>)
          .map((resultJson) => ResultsModel.fromJson(resultJson))
          .toList(),
    );
  }
}
