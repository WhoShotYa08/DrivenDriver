import 'package:driven_driver/models/circles_design.dart';
import 'package:driven_driver/models/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    //controllers
    final emailController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
      super.dispose();
    }

    Future passwordReset() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text("Password Reset Link Sent!"),
              );
            });
      } on FirebaseAuthMultiFactorException catch (e) {
        print(e);
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message.toString()),
              );
            });
      }
    }

    //validators
    bool emailValidator = false;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //The circles right at the top of the page
            const CirclesDesign(),

            SizedBox(
              height: height * 0.15,
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
                  visible: emailValidator,
                  child: const Text(
                    "Email Field cannot be empty",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),

            const SizedBox(
              height: 15,
            ),

            SizedBox(
              width: width * 0.65,
              child: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(116, 52, 164, 0.8),
                onPressed: () {
                  setState(() {
                    emailValidator = emailController.text.isEmpty;
                  });

                  passwordReset();
                },
                child: const Text(
                  "Reset Password",
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
          ],
        ),
      ),
    );
  }
}
