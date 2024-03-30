import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/constants/constats.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Dio buildDioClient(String base) {
  final options = BaseOptions(
    baseUrl: Constnats.baseUrl,
  );
  final dio = Dio(options);
  final talker = TalkerFlutter.init();
  dio.interceptors.add(TalkerDioLogger(talker: talker));
  return dio;
}
