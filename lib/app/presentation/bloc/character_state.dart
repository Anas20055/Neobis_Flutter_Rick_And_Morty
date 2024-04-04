part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  final CharacterEntity? characters;
  final DioException? error;

  const CharacterState({this.characters, this.error});

  @override
  List<Object> get props => [
        characters ?? '',
        error ?? '',
      ];
}

class CharacterLoading extends CharacterState {
  const CharacterLoading();
}

class CharacterDone extends CharacterState {
  const CharacterDone(CharacterEntity characters)
      : super(characters: characters);
}

class CharacterError extends CharacterState {
  const CharacterError(DioException error) : super(error: error);
}
