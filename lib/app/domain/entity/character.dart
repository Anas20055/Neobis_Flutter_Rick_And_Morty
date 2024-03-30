import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/app/domain/entity/info.dart';
import 'package:rick_and_morty_app/app/domain/entity/results.dart';

class CharacterEntity extends Equatable {
  final InfoEntity? info;
  final List<ResultsEntity>? results;

  const CharacterEntity(
    this.info,
    this.results,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [info, results];
}
