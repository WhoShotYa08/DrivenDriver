import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width * 0.4,
              child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.black,
                  child: const Center(
                    child: Image(
                        width: 50,
                        height: 50,
                        image: AssetImage("assets/images/apple_logo.png")),
                  )),
            ),
            SizedBox(
              width: width * 0.4,
              child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 58, 88, 151),
                  hoverColor: const Color.fromARGB(255, 58, 88, 151),
                  child: const Center(
                    child: Image(
                        width: 50,
                        height: 50,
                        image: AssetImage("assets/images/facebook_logo.png")),
                  )),
            ),

          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: width * 0.9,
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
    );
  }
}
