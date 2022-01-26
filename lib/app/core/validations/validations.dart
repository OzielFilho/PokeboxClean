class Validations {
  bool invalidUri(String uri) {
    return uri.isEmpty || uri == '';
  }

  bool invalidLen(int len) {
    return len < 0;
  }
}
