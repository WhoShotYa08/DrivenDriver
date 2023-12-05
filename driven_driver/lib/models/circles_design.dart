import 'package:flutter/material.dart';

class CirclesDesign extends StatelessWidget {
  const CirclesDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return SizedBox(
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
    );
  }
}
