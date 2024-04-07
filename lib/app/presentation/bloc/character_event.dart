part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  final Params? params;
  final bool isSearch;
  const CharacterEvent(this.params, this.isSearch);

  @override
  // TODO: implement props
  List<Object?> get props => [params];
}

class GetCharacters extends CharacterEvent {
  const GetCharacters(Params super.params, super.isSearch);
}
