import 'package:rick_and_morty_app/app/domain/entity/character.dart';
import 'package:rick_and_morty_app/core/resourses/data_state.dart';

abstract class CharacterRepo {
  Future<DataState<CharacterEntity>> getCharacters({
    String? name,
    String? species,
    String? status,
    String? type,
    String? gender,
    int? page,
  });
}
