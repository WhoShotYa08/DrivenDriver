import 'package:driven_driver/models/circles_design.dart';
import 'package:driven_driver/models/text_input.dart';
import 'package:driven_driver/pages/forgot.dart';
import 'package:driven_driver/models/login_options.dart';
import 'package:driven_driver/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    //controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    //validators
    bool isVisible = false;
    bool passwordValidator = false;

    void userNotFoundException() {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('User Not Found'),
            );
          });
    }

    void login() async {
      //on logging in show loading circle
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (context.mounted) Navigator.pop(context);
        print('Error: ${e.code}');
      }
      // removes the loading circle once logged in
      if (context.mounted) Navigator.pop(context);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //The circles right at the top of the page
              const CirclesDesign(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
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
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
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
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: TextInput(
                        controller: passwordController,
                        placeholder: "Password",
                        privateText: true),
                  )
                ]),
              ),

              SizedBox(
                width: width * 0.8,
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
                  width: width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
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
                width: width * 0.65,
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
                height: 25,
              ),

              SizedBox(
                height: height * 0.8,
                child: const LoginOptions(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
