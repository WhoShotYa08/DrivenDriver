import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driven_driver/models/circles_design.dart';
import 'package:driven_driver/models/login_options.dart';
import 'package:driven_driver/models/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    //controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
      super.dispose();
    }

    void signUp() async {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });

      if (passwordController.text != confirmPasswordController.text) {
        Navigator.pop(context);
      }

      try {
        if (passwordController.text == confirmPasswordController.text) {
          FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        print(e.code);
      }
    }



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
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: TextInput(
                        controller: emailController,
                        placeholder: "Email",
                        privateText: false),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: TextInput(
                        controller: passwordController,
                        placeholder: "Password",
                        privateText: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
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
                width: width * 0.65,
                child: FloatingActionButton(
                  backgroundColor: const Color.fromRGBO(116, 52, 164, 0.8),
                  onPressed: signUp,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
