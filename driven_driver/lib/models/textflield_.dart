import 'package:flutter/material.dart';

class AwesomeText extends StatelessWidget {
  final TextEditingController controller_;
  final IconData icon;
  final String label;
  final TextInputType type;
  final Function tap;

  const AwesomeText({
    super.key,
    required this.controller_,
    required this.icon,
    required this.label,
    required this.type,
    required this.tap
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller_,
      keyboardType: type,
      validator: (value) {
        if (value!.isEmpty) {
          return "$label Field cannot be empty";
        }
      },
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(225, 116, 52, 164)))),
    );
  }
}
