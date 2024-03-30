import 'package:rick_and_morty_app/app/domain/entity/character.dart';
import 'package:rick_and_morty_app/app/domain/entity/params.dart';
import 'package:rick_and_morty_app/app/domain/repository/character_repo.dart';
import 'package:rick_and_morty_app/core/constants/data_state.dart';
import 'package:rick_and_morty_app/core/usecases/usecase.dart';

class GetCharacterUseCase
    implements UseCases<DataState<CharacterEntity>, Params> {
  final CharacterRepo _characterRepo;

  GetCharacterUseCase(this._characterRepo);
  @override
  Future<DataState<CharacterEntity>> call({Params? params}) {
    return _characterRepo.getCharacters(
        name: params?.name,
        species: params?.species,
        status: params?.status,
        type: params?.type,
        gender: params?.gender);
  }
}
