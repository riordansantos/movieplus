import 'package:dio/dio.dart';
import 'package:movieplus/src/core/model/movie.dart';

class HomeTabWidgetController {
  // replace by dependency injection
  final Dio _dio = Dio();

  final _endpointMovies = const String.fromEnvironment("endpointMovies",
      defaultValue: "http://localhost:3000/movies");

  Future<List<Movie>> getMoviesList() async {
    try {
      final Response<List<dynamic>> response = await _dio.get<List<dynamic>>(
          _endpointMovies,
          options: Options(contentType: Headers.jsonContentType));

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data ?? [];

        return data.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
