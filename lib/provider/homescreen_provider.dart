import 'package:flutter/material.dart';
import 'package:quadbtech_test/model/movie_model.dart';
import 'package:quadbtech_test/services/api_integration.dart';

class HomescreenProvider with ChangeNotifier {
  int _currentIndex = 0;
  get currentindex => _currentIndex;
 final List<MovieModel> _movielist = [];
  List<MovieModel> get movielist => _movielist;
  bool _isloading = false;
  bool get isloading => _isloading;

  onPageChange(index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> fetchMovie({String search = "all"}) async {
    _isloading = true;
    _movielist.clear();
    notifyListeners();
    final response = await MovieService().getMovies(search);

    _movielist.addAll(response);
    _isloading = false;

    // log(response.toString());
    notifyListeners();
  }
}
