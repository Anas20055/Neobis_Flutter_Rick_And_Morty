import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/app/data/data_sources/rick_and_morty_service.dart';
import 'package:rick_and_morty_app/app/data/repository/character_repo_impl.dart';
import 'package:rick_and_morty_app/app/domain/repository/character_repo.dart';
import 'package:rick_and_morty_app/app/domain/usecases/get-character.dart';
import 'package:rick_and_morty_app/app/domain/usecases/get_episode.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/bloc/episode_bloc.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/core/constants/constats.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "dio_client.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = _buildDioClient(Constnats.baseUrl);
  sl.registerSingleton<RickAndMortyService>(RickAndMortyService(dio));
  sl.registerSingleton<CharacterRepo>(CharacterRepoImpl(sl()));
  sl.registerSingleton<GetEpisodeUseCase>(GetEpisodeUseCase(sl()));
  sl.registerSingleton<GetCharacterUseCase>(GetCharacterUseCase(sl()));
  sl.registerSingleton<CharacterBloc>(CharacterBloc(sl()));
  sl.registerSingleton<EpisodeBloc>(EpisodeBloc(sl()));
}
