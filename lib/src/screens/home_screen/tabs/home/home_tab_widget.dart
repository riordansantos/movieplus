import 'package:flutter/material.dart';
import 'package:movieplus/src/core/model/movie.dart';
import 'package:movieplus/src/core/model/menu_model.dart';
import 'package:movieplus/src/screens/home_screen/tabs/home/home_tab_widget_controller.dart';
import 'package:movieplus/src/screens/home_screen/widgets/movies_menu_widget.dart';
import 'package:movieplus/src/screens/home_screen/widgets/search_field_widget.dart';
import 'package:provider/provider.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({Key? key}) : super(key: key);

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  final TextEditingController _searchController = TextEditingController();
  final HomeTabWidgetController _controller = HomeTabWidgetController();

  bool loading = true;
  String error = "";

  @override
  void initState() {
    super.initState();

    final MenuModel _menuModel = Provider.of<MenuModel>(context, listen: false);

    _controller.getMoviesList().then((List<Movie> movies) {
      setState(() {
        _menuModel
          ..clearAll()
          ..addAllMovies(movies);

        error = "";
        loading = false;
      });
    }).catchError((err) {
      debugPrint(err.toString());

      setState(() {
        error = err.toString();
        loading = false;
      });
    });

    _searchController.addListener(() {
      _menuModel.filterMenu(_searchController.text); // menu filter
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _maxWidth = MediaQuery.of(context).size.width;

    if (error.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(error),
        ),
      );
    }

    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
          left: _maxWidth * 0.1, right: _maxWidth * 0.1, top: _maxWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchFieldWidget(controller: _searchController),
          const Expanded(child: MoviesMenuWidget()),
          const Expanded(child: MoviesMenuWidget()),
        ],
      ),
    );
  }
}
