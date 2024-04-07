part of "injection_container.dart";

Dio _buildDioClient(String base) {
  final options = BaseOptions(
    baseUrl: base,
  );
  final dio = Dio(options);
  final talker = TalkerFlutter.init();
  dio.interceptors.add(TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestData: false,
        printResponseData: false,
        printResponseHeaders: false,
        printRequestHeaders: true,
        printResponseMessage: false,
      ),
      talker: talker));
  return dio;
}
