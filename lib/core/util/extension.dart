extension UrlExtension on String {
  String extractPath() {
    List<String> parts = split("/");
    String path = "/${parts.skip(4).join("/")}";
    return path;
  }
}
