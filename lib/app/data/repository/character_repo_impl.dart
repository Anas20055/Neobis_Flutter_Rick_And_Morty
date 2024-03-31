import 'package:rick_and_morty_app/app/data/data_sources/rick_and_morty_service.dart';
import 'package:rick_and_morty_app/app/data/model/character.dart';
import 'package:rick_and_morty_app/app/domain/repository/character_repo.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/resourses/data_state.dart';

class CharacterRepoImpl implements CharacterRepo {
  final RickAndMortyService _rickAndMortyService;

  CharacterRepoImpl(this._rickAndMortyService);
  @override
  Future<DataState<CharacterModel>> getCharacters({
    String? name,
    String? species,
    String? status,
    String? type,
    String? gender,
    int? page,
  }) async {
    try {
      final httpResponse = await _rickAndMortyService.getCharacters(
          name: name,
          species: species,
          status: status,
          type: type,
          gender: gender,
          page: page);

      return DataSuccess(httpResponse.data);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
