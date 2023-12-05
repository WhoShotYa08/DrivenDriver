import 'package:driven_driver/auth/auth_page.dart';
import 'package:driven_driver/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:driven_driver/models/onbording_content.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<Onboarding> {
  int currentIndex = 0;

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: PageView.builder(
              controller: _controller,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, x) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Lottie.network(content[x].asset)),
                    const SizedBox(height: 15),
                    Text(
                      content[x].title,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      content[x].description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              })),
      Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                content.length, (index) => _buildDot(index, context))),
      ),
      const SizedBox(height: 15),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: FloatingActionButton(
          heroTag: 'btn',
          onPressed: () {
            if (currentIndex == content.length - 1) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AuthPage()));
            }
            _controller.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.linear);
          },
          backgroundColor: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            content.length - 1 == currentIndex ? "Get Started!" : "Next",
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ),
      const SizedBox(height: 35)
    ]));
  }

  Container _buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor),
    );
  }
}
