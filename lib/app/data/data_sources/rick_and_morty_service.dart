import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_app/app/data/model/character.dart';
import 'package:rick_and_morty_app/app/data/model/episode.dart';
import 'package:rick_and_morty_app/core/constants/constats.dart';

part 'rick_and_morty_service.g.dart';

@RestApi(baseUrl: Constnats.baseUrl)
abstract class RickAndMortyService {
  factory RickAndMortyService(Dio dio) = _RickAndMortyService;
  @GET('/character')
  Future<HttpResponse<CharacterModel>> getCharacters({
    @Query("name") String? name,
    @Query("species") String? species,
    @Query("status") String? status,
    @Query("type") String? type,
    @Query("gender") String? gender,
    @Query("page") int? page,
  });

  @GET('/episode')
  Future<HttpResponse<List<EpisodeModel>>> getEpisodes(String? url);

  @GET('/episode')
  Future<HttpResponse<EpisodeModel>> getEpisode(String? url);
}
