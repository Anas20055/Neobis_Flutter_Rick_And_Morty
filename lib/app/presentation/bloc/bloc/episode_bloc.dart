import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/app/domain/entity/episode.dart';
import 'package:rick_and_morty_app/app/domain/usecases/get_episode.dart';
import 'package:rick_and_morty_app/core/util/extension.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodeUseCase _getEpisodeUseCase;
  EpisodeBloc(this._getEpisodeUseCase) : super(const EpisodeLoading()) {
    on<GetEpisode>(onGetEpisode);
  }
  void onGetEpisode(GetEpisode event, Emitter<EpisodeState> emit) async {
    emit(const EpisodeLoading());
    try {
      String urls = event.urls.map((e) => e.extractPath()).join(',');
      final dataState = await _getEpisodeUseCase.call(params: urls);

      emit(EpisodeDone(dataState));
    } on DioException catch (e) {
      emit(EpisodeError(e));
    }
  }
}
