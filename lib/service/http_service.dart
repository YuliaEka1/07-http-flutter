import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import '../models/movie.dart';

class HttpService {
  final String apiKey = '6fe8d7318ba66fad7df02a61cee24c9d';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));

    if (result.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("Sukses");
      }
      final response = json.decode(result.body);
      final moviesMap = response['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      if (kDebugMode) {
        print("Gagal");
      }
      return null;
    }
  }
}
