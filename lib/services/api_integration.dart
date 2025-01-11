import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:quadbtech_test/model/movie_model.dart';

abstract class Apicalls {
  Future<List<MovieModel>> getMovies(String query);
}

class MovieService implements Apicalls {
  

  @override
  Future<List<MovieModel>> getMovies(String query) async {
    try {
      String url = "https://api.tvmaze.com/search/shows?q=$query";
      log(url);
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        // log(result.toString());
        final data = result;
        return MovieModel.fromApi(data);
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
 
 
 