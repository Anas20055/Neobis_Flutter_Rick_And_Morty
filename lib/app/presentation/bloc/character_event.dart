part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  final Params? params;
  const CharacterEvent(this.params);

  @override
  // TODO: implement props
  List<Object?> get props => [params];
}

class GetCharacters extends CharacterEvent {
  const GetCharacters(Params params) : super(params);
}
