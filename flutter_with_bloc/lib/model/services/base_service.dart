abstract class BaseService {
  final String baseUrl = "https://restcountries.com/v3.1";
  Future getResponse(String url);
}
