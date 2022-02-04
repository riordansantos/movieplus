import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieplus/src/screens/get_started/get_started_screen.dart';
import 'package:movieplus/src/screens/home_screen/home_screen.dart';
import 'package:movieplus/src/screens/login_screen/login_screen.dart';

class MoviePlusApp extends StatelessWidget {
  const MoviePlusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MoviePlus",
      // removido o banner de debug da aplicação
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const GetStartedScreen(),
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFEA334F),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "Delius",
            fontSize: 62,
            height: 0.8,
            fontWeight: FontWeight.w800,
            color: Color(0xFFFFFFFF),
          ),
          button: TextStyle(
            fontFamily: "Delius",
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF6F6F9),
          ),
          // formatação do texto do input
          subtitle1: TextStyle(
            fontFamily: "Delius",
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFFF6f6f9),
            decoration: TextDecoration.none,
          ),
          subtitle2: TextStyle(
            fontFamily: "Delius",
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFFf6f6f9),
            decoration: TextDecoration.none,
          ),
        ),

        // cor do cursor da caixa de texto - iOS
        cupertinoOverrideTheme:
            const CupertinoThemeData(primaryColor: Color(0xFFEA334F)),
        // cor do cursor da caixa de texto - Android, Fuchsia, etc.
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFEA334F),
          selectionColor: Color(0xFFEA334F),
          selectionHandleColor: Color(0xFFEA334F),
        ),

        // remover o padding do TextButton
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
        ),

        // incluído o tema dos labels das caixas de texto da aplicação
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
              fontFamily: "Delius",
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFFF9f9f6)),
          // cor da linha da caixa de texto
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFf9f9f6))),
          // cor da linha da caixa de texto quando estiver selecionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEA334F))),
        ),
      ),
    );
  }
}
