import 'package:driven_driver/models/text_input.dart';
import 'package:driven_driver/pages/bottom_nav.dart';
import 'package:driven_driver/pages/forgot.dart';
import 'package:driven_driver/pages/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
    bool isVisible = false;
    bool passwordValidator = false;

    void login() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                    top: -_height * 0.1,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                height: 10,
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
                  Visibility(
                    visible: isVisible,
                    child: const Text(
                      "Email Field cannot be empty",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
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

              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotScreen()));
                },
                child: SizedBox(
                  width: _width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.01),
                    child: const Text(
                      "Forgot Password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
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
                    setState(() {
                      isVisible = emailController.text.isEmpty;
                    });

                    login();
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                child: const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey),
                        )),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    )),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: _width * 0.4,
                      child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.black,
                          child: const Center(
                            child: Image(
                                width: 50,
                                height: 50,
                                image:
                                    AssetImage("assets/images/apple_logo.png")),
                          )),
                    ),
                    SizedBox(
                      width: _width * 0.4,
                      child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor:
                              const Color.fromARGB(255, 58, 88, 151),
                          hoverColor: const Color.fromARGB(255, 58, 88, 151),
                          child: const Center(
                            child: Image(
                                width: 50,
                                height: 50,
                                image: AssetImage(
                                    "assets/images/facebook_logo.png")),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: _width * 0.9,
                child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                    hoverColor: const Color.fromARGB(255, 245, 245, 245),
                    child: const Center(
                      child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/google_logo.png")),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
