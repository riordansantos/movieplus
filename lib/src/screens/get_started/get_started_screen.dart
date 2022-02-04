import 'package:flutter/material.dart';
import 'package:movieplus/src/core/widgets/action_button_widget.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF333645),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.12),
                child: Text(
                  "MoviePlus",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/background.png", width: screenWidth),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    "Start",
                    backgroundColor: const Color(0xFFEA334F),
                    foregroundColor: const Color(0xFFf9f9f6),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
