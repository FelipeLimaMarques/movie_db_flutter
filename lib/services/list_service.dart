import 'package:http/http.dart' as http;
import 'package:movie_db_flutter/secrets.dart';

class ListService {
  static const Map<String, String> header = {
    'Authorization': Secrets.bearerToken,
    'Content-Type': 'application/json;charset=utf-8',
  };
  static const String apiUrl = 'https://api.themoviedb.org/4/list';
  static const String apiKey = Secrets.apiKey;

  Future<void> getMovieList() async {
    final Uri url = Uri.parse('$apiUrl/1?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception();
    }
  }
}
