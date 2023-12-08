import 'package:flutter/material.dart';

class CreateBookingScreen extends StatefulWidget {
  const CreateBookingScreen({super.key});

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  @override
  bool destinationFilled = false;

  //Controllers
  final dateTimeController = TextEditingController();
  final depatureTownController = TextEditingController();
  final departureStreetController = TextEditingController();
  final destinationTownController = TextEditingController();
  final destinaitonStreetController = TextEditingController();
  final costController = TextEditingController();
  final passengerController = TextEditingController();
  final availableSeatsController = TextEditingController();

  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
                visible: destinationFilled,
                child: const Text("Flied cannot be left empty",
                    style: TextStyle(color: Colors.red))),
            SizedBox(
                width: width * 0.8,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Text("Submit"),
                ))
          ],
        ),
      ),
    );
  }
}
