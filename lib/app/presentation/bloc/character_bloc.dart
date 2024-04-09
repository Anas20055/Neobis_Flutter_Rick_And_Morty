import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/app/domain/entity/character.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/app/domain/entity/params.dart';
import 'package:rick_and_morty_app/app/domain/usecases/get-character.dart';
import 'package:rxdart/rxdart.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacterUseCase _getCharacterUseCase;
  CharacterBloc(this._getCharacterUseCase) : super(const CharacterLoading()) {
    on<GetCharacters>(
      onGetCharacters,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .asyncExpand(mapper);
      },
    );
  }
  void onGetCharacters(
      GetCharacters event, Emitter<CharacterState> emit) async {
    try {
      if (event.isSearch) {
        emit(const CharacterLoading());
      }
      final dataState = await _getCharacterUseCase.call(params: event.params);
      emit(CharacterDone(dataState));
    } on DioException catch (e) {
      emit(CharacterError(e));
    }
  }
}
