import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driven_driver/models/circles_design.dart';
import 'package:driven_driver/models/text_input.dart';
import 'package:driven_driver/models/textflield_.dart';
import 'package:driven_driver/pages/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UpdateBookingScreen extends StatefulWidget {
  final Object liftDetails;
  const UpdateBookingScreen({super.key, required this.liftDetails});

  @override
  State<UpdateBookingScreen> createState() => _UpdateBookingScreenState();
}

class _UpdateBookingScreenState extends State<UpdateBookingScreen> {
  final formField = GlobalKey<FormState>();

  //current user id
  final user = FirebaseAuth.instance.currentUser!;

  //Controllers
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final depatureTownController = TextEditingController();
  final departureStreetController = TextEditingController();
  final destinationTownController = TextEditingController();
  final destinationStreetController = TextEditingController();
  final costController = TextEditingController();
  final passengerController = TextEditingController();
  final availableSeatsController = TextEditingController();

  Future<void> selectTime(BuildContext context) async {
    final time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      print("${time.hour.toString()}:${time.minute.toString()}");
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024, DateTime.march));

    if (date != null) {
      print(date.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formField,
          child: Column(
            children: [
              const CirclesDesign(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                        controller: availableSeatsController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Available Seats",
                            prefixIcon: Icon(Icons.chair),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Color.fromARGB(225, 116, 52, 164))))),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: costController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: "Cost",
                          prefixIcon: Icon(Icons.attach_money_outlined),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(225, 116, 52, 164)))),
                    ),
                    const SizedBox(height: 6),
                    // Date and Time
                    TextFormField(
                        controller: dateController,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          selectDate(context);
                        },
                        decoration: const InputDecoration(
                            labelText: "Date(YYYY-MM-DD) Time(HH:MM:SS)",
                            prefixIcon: Icon(Icons.departure_board),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Color.fromARGB(225, 116, 52, 164))))),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.49,
                          child: TextFormField(
                              controller: departureStreetController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  labelText: "Departure Street",
                                  prefixIcon: Icon(Icons.departure_board),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              225, 116, 52, 164))))),
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: TextFormField(
                              controller: depatureTownController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  labelText: "Departure Town",
                                  prefixIcon: Icon(Icons.location_city),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              225, 116, 52, 164))))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.49,
                          child: TextFormField(
                              controller: destinationStreetController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  labelText: "Destination Street",
                                  prefixIcon: Icon(Icons.location_pin),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              225, 116, 52, 164))))),
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: TextFormField(
                              controller: destinationTownController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  labelText: "Destination Town",
                                  prefixIcon: Icon(Icons.location_city),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              225, 116, 52, 164))))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    SizedBox(
                      width: width * 0.8,
                      child: FloatingActionButton(
                        onPressed: () {
                          final create = FirebaseFirestore.instance
                              .collection('Lifts')
                              .doc();

                          create.set({
                            'availableSeats':
                                int.parse(availableSeatsController.text.trim()),
                            'costShareDescription': costController.text.trim(),
                            'departureDateTime':
                                DateTime.parse(dateController.text.trim()),
                            'departureStreet':
                                departureStreetController.text.trim(),
                            'departureTown': depatureTownController.text.trim(),
                            'destinationStreet':
                                destinationStreetController.text.trim(),
                            'destinationTown':
                                destinationTownController.text.trim(),
                            'lift_id': create.id,
                            'numberOfPassenger': 0,
                            'owner_id': user.uid
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNav()));
                        },
                        child: const Text(
                          "Update Ride",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
