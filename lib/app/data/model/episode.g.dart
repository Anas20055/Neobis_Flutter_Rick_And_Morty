// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      name: json['name'] as String,
      episode: json['episode'] as String,
      air_date: json['air_date'] as String,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'episode': instance.episode,
      'name': instance.name,
      'air_date': instance.air_date,
    };
