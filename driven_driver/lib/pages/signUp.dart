import 'package:driven_driver/models/textInput.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    //controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //The circles right at the top of the page
            SizedBox(
              height: _height * 0.39,
              child: Stack(children: [
                Positioned(
                    top: -_height * 0.15,
                    left: -_width * 0.15,
                    child: Container(
                      width: _width * 0.6,
                      height: _width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_width),
                          color: const Color.fromARGB(225, 116, 52, 164)),
                    )),
                Positioned(
                  top: -_height * 0.15,
                  left: _width * 0.35,
                  child: Container(
                      width: _width * 0.7,
                      height: _width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_width),
                          color: const Color.fromARGB(255, 209, 164, 243))),
                )
              ]),
            ),

            SizedBox(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextInput(
                      controller: emailController,
                      placeholder: "Email",
                      privateText: false),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
