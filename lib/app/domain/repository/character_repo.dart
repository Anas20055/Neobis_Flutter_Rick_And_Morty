import 'package:rick_and_morty_app/app/domain/entity/character.dart';
import 'package:rick_and_morty_app/app/domain/entity/episode.dart';

abstract class CharacterRepo {
  Future<CharacterEntity> getCharacters({
    String? name,
    String? species,
    String? status,
    String? type,
    String? gender,
    int? page,
  });

  Future<List<EpisodeEntity>> getEpisode(String? url);
}
