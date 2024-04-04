import 'package:rick_and_morty_app/app/data/data_sources/rick_and_morty_service.dart';
import 'package:rick_and_morty_app/app/data/model/character.dart';
import 'package:rick_and_morty_app/app/data/model/episode.dart';
import 'package:rick_and_morty_app/app/domain/repository/character_repo.dart';

class CharacterRepoImpl implements CharacterRepo {
  final RickAndMortyService _rickAndMortyService;

  CharacterRepoImpl(this._rickAndMortyService);
  @override
  Future<CharacterModel> getCharacters({
    String? name,
    String? species,
    String? status,
    String? type,
    String? gender,
    int? page,
  }) async {
    final httpResponse = await _rickAndMortyService.getCharacters(
        name: name,
        species: species,
        status: status,
        type: type,
        gender: gender,
        page: page);

    return httpResponse.data;
  }

  @override
  Future<EpisodeModel> getEpisode(String? url) async {
    final httpResponse = await _rickAndMortyService.getEpisode(url);
    return httpResponse.data;
  }
}
