abstract class IClientHttp {
  void addToken(String token);
  Future get(String url);
}
