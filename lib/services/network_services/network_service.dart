import 'package:about_film/models/popular/popular_page_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

http.Client client = http.Client();

String _baseUrl =
    'https://api.themoviedb.org/3/movie';

String _apiKey = "7c306df82f88282cab6dbc20faa3bb50";

String token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzMwNmRmODJmODgyODJjYWI2ZGJjMjBmYWEzYmI1MCIsInN1YiI6IjVlNTVlZjlhMzU4MTFkMDAxNTVjMTM0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AGShBjZEWA6SFg_a04xjWblTZEZLF8z8NZKDPiqYtmE";

Future<Popular> getPopularPage() async {
  final response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
  print(response.statusCode.toString());
  if (response.statusCode == 200) {
    return PopularFromJson(response.body);
  } else {
    print("Status code : ${response.statusCode}");
    throw Exception('Failed to load movies list');
  }
}
