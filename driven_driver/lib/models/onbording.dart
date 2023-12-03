import 'package:flutter/material.dart';
import 'package:driven_driver/models/onbording_content.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: PageView.builder(
              itemCount: content.length,
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

      // Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: List.generate(content.length, (index) => buildDot(context)),
      //   ),
      // ),

      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ),
      const SizedBox(height: 35)
    ]));
  }
}
