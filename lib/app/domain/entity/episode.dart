import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final String episode;
  final String name;
  final String air_date;

  const EpisodeEntity({
    required this.episode,
    required this.name,
    required this.air_date,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [episode, name, air_date];
}
