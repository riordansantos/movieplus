import 'package:flutter/material.dart';
import 'package:movieplus/src/screens/login_screen/widgets/login_widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // detecção se o teclado está aberto

    return Scaffold(
      backgroundColor: const Color(0xFF333645),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login to continue!",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
              const LoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
