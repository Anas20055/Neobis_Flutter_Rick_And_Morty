import 'package:rick_and_morty_app/app/domain/entity/episode.dart';
import 'package:rick_and_morty_app/app/domain/repository/character_repo.dart';
import 'package:rick_and_morty_app/core/usecases/usecase.dart';

class GetEpisodeUseCase implements UseCases<List<EpisodeEntity>, String> {
  final CharacterRepo _characterRepo;

  GetEpisodeUseCase(this._characterRepo);
  @override
  Future<List<EpisodeEntity>> call({String? params}) {
    return _characterRepo.getEpisode(params);
  }
}
