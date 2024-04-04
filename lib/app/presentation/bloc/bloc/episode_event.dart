part of 'episode_bloc.dart';

abstract class EpisodeEvent extends Equatable {
  final List<String> urls;
  const EpisodeEvent(this.urls);

  @override
  // TODO: implement props
  List<Object?> get props => [urls];
}

class GetEpisode extends EpisodeEvent {
  const GetEpisode(super.urls);
}
