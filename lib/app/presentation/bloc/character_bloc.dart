import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/app/domain/entity/character.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/app/domain/entity/params.dart';
import 'package:rick_and_morty_app/app/domain/usecases/get-character.dart';
import 'package:rick_and_morty_app/core/constants/data_state.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacterUseCase _getCharacterUseCase;
  CharacterBloc(this._getCharacterUseCase) : super(const CharacterLoading()) {
    on<GetCharacters>(onGetCharacters);
  }
  void onGetCharacters(
      GetCharacters event, Emitter<CharacterState> emit) async {
    final dataState = await _getCharacterUseCase.call(params: event.params);
    if (dataState is DataSuccess && dataState.data!.results!.isNotEmpty) {
      emit(CharacterDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print("${dataState.error}");

      emit(CharacterError(dataState.error!));
    }
  }
}
