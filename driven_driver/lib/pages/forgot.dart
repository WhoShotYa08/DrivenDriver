import 'package:driven_driver/models/text_input.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    //controllers
    final emailController = TextEditingController();

    //validators
    bool emailValidator = false;

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
              height: _height * 0.15,
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
              ]),
            ),

            const SizedBox(
              height: 15,
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
