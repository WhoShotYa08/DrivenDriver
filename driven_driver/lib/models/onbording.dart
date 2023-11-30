import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: 3,
            itemBuilder: (_, x) {
              return Column(
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.4,
                    image: const AssetImage("images/logo.jpeg"),
                  )
                ],
              );
            }));
  }
}
