import 'dart:math';

import 'package:driven_driver/models/textInput.dart';
import 'package:driven_driver/pages/signUp.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    //controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    //validators
    bool emailValidator = true;
    bool passwordValidator = true;

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
              height: _height * 0.1,
            ),

            SizedBox(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                  child: TextInput(
                      controller: emailController,
                      placeholder: "Email",
                      privateText: false),
                ),
                SizedBox(
                  width: _width * 0.8,
                  child: Visibility(
                    visible: emailValidator,
                    child: const Text(
                      "Email Field cannot be empty",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                  child: TextInput(
                      controller: passwordController,
                      placeholder: "Password",
                      privateText: true),
                )
              ]),
            ),

            SizedBox(
              width: _width * 0.8,
              child: Visibility(
                visible: passwordValidator,
                child: const Text(
                  "Password Field cannot be empty",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Do not have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(
                            color: Color.fromARGB(255, 209, 164, 243),
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            SizedBox(
              width: _width * 0.65,
              child: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(116, 52, 164, 0.8),
                onPressed: () {
                  if (emailController.text == '') {
                    setState(() {
                      emailValidator = true;
                    });
                  } else {
                    setState(() {
                      emailValidator = false;
                    });
                  }

                  print(emailValidator);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
