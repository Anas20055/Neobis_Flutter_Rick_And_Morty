extension UrlExtension on String {
  String extractPath() {
    List<String> parts = split("/");
    String path = "${parts.skip(5).join()}";
    return path;
  }
}
