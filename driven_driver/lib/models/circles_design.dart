import 'package:flutter/material.dart';

class CirclesDesign extends StatelessWidget {
  const CirclesDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.39,
      child: Stack(children: [
        Positioned(
            top: -height * 0.15,
            left: -width * 0.15,
            child: Container(
              width: width * 0.6,
              height: width * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width),
                  color: const Color.fromARGB(225, 116, 52, 164)),
            )),
        Positioned(
          top: -height * 0.1,
          left: width * 0.35,
          child: Container(
              width: width * 0.7,
              height: width * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width),
                  color: const Color.fromARGB(255, 209, 164, 243))),
        )
      ]),
    );
  }
}
