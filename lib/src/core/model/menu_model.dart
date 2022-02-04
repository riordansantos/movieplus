import 'package:flutter/material.dart';
import 'package:movieplus/src/core/model/movie.dart';

class MenuModel extends ChangeNotifier {
  final List<Movie> _menu = [];
  final List<Movie> _filteredMenu = [];

  MenuModel({List<Movie> movies = const []}) {
    _menu.addAll(movies);
    _filteredMenu.addAll(movies);
  }

  List<Movie> get menu => List.unmodifiable(_menu);
  List<Movie> get filteredMenu => List.unmodifiable(_filteredMenu);

  void filterMenu(String movieName) {
    if (movieName.trim() == "") {
      _filteredMenu
        ..clear()
        ..addAll(_menu);
    } else {
      _filteredMenu
        ..clear()
        ..addAll(_menu.where((movie) =>
            movie.movieName.toLowerCase().contains(movieName.toLowerCase())));
    }

    notifyListeners();
  }

  void addMovie(Movie movie) {
    _menu.add(movie);
    _filteredMenu.add(movie);
    notifyListeners();
  }

  void addAllMovies(List<Movie> movies) {
    _menu.addAll(movies);
    _filteredMenu.addAll(movies);
    notifyListeners();
  }

  void clearAll() {
    _menu.clear();
    _filteredMenu.clear();
    notifyListeners();
  }
}
