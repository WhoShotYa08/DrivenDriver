import 'package:driven_driver/models/circles_design.dart';
import 'package:driven_driver/models/text_input.dart';
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
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //The circles right at the top of the page
              const CirclesDesign(),

              SizedBox(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                    child: TextInput(
                        controller: emailController,
                        placeholder: "Email",
                        privateText: false),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                    child: TextInput(
                        controller: passwordController,
                        placeholder: "Password",
                        privateText: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                    child: TextInput(
                        controller: confirmPasswordController,
                        placeholder: "Confirm Password",
                        privateText: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),

              const SizedBox(
                height: 30,
              ),

              SizedBox(
                width: _width * 0.65,
                child: FloatingActionButton(
                  backgroundColor: const Color.fromRGBO(116, 52, 164, 0.8),
                  onPressed: () {
                    print(usernameController.text);
                  },
                  child: const Text(
                    "Sign Up",
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
      ),
    );
  }
}
