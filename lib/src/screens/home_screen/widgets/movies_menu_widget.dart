import 'package:flutter/material.dart';
import 'package:movieplus/src/core/model/movie.dart';
import 'package:movieplus/src/core/model/menu_model.dart';
import 'package:movieplus/src/core/widgets/movie_button_widget.dart';

import 'package:provider/provider.dart';

class MoviesMenuWidget extends StatelessWidget {
  const MoviesMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: LayoutBuilder(builder: (context, constraints) {
        final double _maxHeight = constraints.maxHeight;

        return Column(
          children: [
            Container(
              height: _maxHeight * 0.1,
              margin: EdgeInsets.only(
                  top: _maxHeight * 0.08, bottom: _maxHeight * 0.02),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: _maxHeight * 0.04, bottom: _maxHeight * 0.04),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: _maxHeight * 0.68),
                child: TabBarView(
                  children: [
                    Consumer<MenuModel>(builder: (context, menuModel, child) {
                      final List<Movie> _filteredMovies =
                          menuModel.filteredMenu;

                      if (_filteredMovies.isEmpty) {
                        return const Center(child: Text("No films found"));
                      }

                      return ListView.separated(
                        padding:
                            EdgeInsets.symmetric(vertical: _maxHeight * 0.02),
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemBuilder: (_, item) {
                          return MovieButtonWidget(
                            movieName: _filteredMovies[item].movieName,
                            moviePrice: _filteredMovies[item].moviePrice,
                            movieImage: _filteredMovies[item].movieImage,
                            onPressed: () => debugPrint(
                                "Clicked movie: ${_filteredMovies[item].movieName}"),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          width: 20,
                        ),
                        itemCount: _filteredMovies.length,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
