import 'package:flutter/material.dart';

class MovieButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String movieName;
  late final String _movieImage;
  final String moviePrice;
  final double aspectRatio;

  MovieButtonWidget({
    Key? key,
    required this.movieName,
    required this.moviePrice,
    String? movieImage,
    this.aspectRatio = 350 / 330,
    required this.onPressed,
  }) : super(key: key) {
    if (movieImage == null) {
      _movieImage = 'empty';
    } else {
      _movieImage = movieImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints contraints) {
      double _maxHeight = contraints.maxHeight;

      // Inkwell para responder ao toque
      return InkWell(
        onTap: onPressed,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              // fundo branco
              Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  heightFactor: 1,
                  widthFactor: 1,
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0, // suavidade da sombra
                          spreadRadius: 1.0, // espalhamento da sombra
                          offset: Offset(
                            4.0, // move 4 para a direita
                            4.0, // move 4 para baixo
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/$_movieImage.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: _maxHeight * 0.6),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Text(
                      movieName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
