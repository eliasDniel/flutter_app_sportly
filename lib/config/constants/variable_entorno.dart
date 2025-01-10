import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
class Environment {
  static String theApiKey = dotenv.env['API_KEY'] ?? 'No hay api key';
  
}
final dio =
      Dio(BaseOptions(baseUrl: 'https://api.football-data.org/v4', headers: {
    'X-Auth-Token': "0217b02d9bc24f4c94d74e196cd6c72f",
  }));
