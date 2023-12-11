import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driven_driver/models/circles_design.dart';
import 'package:driven_driver/models/text_input.dart';
import 'package:driven_driver/models/textflield_.dart';
import 'package:driven_driver/pages/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateBookingScreen extends StatefulWidget {
  const CreateBookingScreen({super.key});

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
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
                    AwesomeText(
                        controller_: availableSeatsController,
                        icon: Icons.chair,
                        label: "Available Seats",
                        type: TextInputType.number,
                        tap: () {}),
                    const SizedBox(height: 6),
                    AwesomeText(
                      controller_: costController,
                      icon: Icons.attach_money_outlined,
                      label: "Cost",
                      type: TextInputType.text,
                      tap: () {},
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.59,
                          child: AwesomeText(
                            controller_: departureStreetController,
                            icon: Icons.departure_board,
                            label: "Date",
                            type: TextInputType.datetime,
                            tap: () {
                              selectDate(context);
                            },
                          ),
                        ),
                        SizedBox(
                            width: width * 0.35,
                            child: AwesomeText(
                                controller_: timeController,
                                icon: Icons.timer,
                                label: "Time",
                                type: TextInputType.datetime,
                                tap: () {
                                  selectTime(context);
                                })),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.49,
                          child: AwesomeText(
                              controller_: departureStreetController,
                              icon: Icons.departure_board,
                              label: "Departure Street",
                              type: TextInputType.text,
                              tap: () {}),
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: AwesomeText(
                              controller_: depatureTownController,
                              icon: Icons.location_city,
                              label: "Departure Town",
                              type: TextInputType.text,
                              tap: () {}),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.49,
                          child: AwesomeText(
                              controller_: destinationStreetController,
                              icon: Icons.location_pin,
                              label: "Destination Street",
                              type: TextInputType.text,
                              tap: () {}),
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: AwesomeText(
                              controller_: destinationTownController,
                              icon: Icons.location_city,
                              label: "Destination Town",
                              type: TextInputType.text,
                              tap: () {}),
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
                            'departureDateTime': dateController.text.trim(),
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
                          "Create Ride",
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
