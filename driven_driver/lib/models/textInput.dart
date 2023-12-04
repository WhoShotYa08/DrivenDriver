import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool privateText;

  const TextInput(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.privateText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: privateText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
