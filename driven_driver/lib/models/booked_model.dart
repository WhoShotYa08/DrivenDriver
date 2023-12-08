import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookedContainer extends StatelessWidget {
  int passengers;
  int availableSeats;
  String driver;
  String location;
  String date;
  String time;
  String destination;
  String cost;

  BookedContainer(
      {super.key,
      required this.passengers,
      required this.availableSeats,
      required this.driver,
      required this.location,
      required this.destination,
      required this.date,
      required this.time,
      required this.cost});

  // user email
  final user = FirebaseAuth.instance.currentUser!;

  final Color light = const Color.fromARGB(255, 209, 164, 243);
  final Color dark = const Color.fromARGB(225, 116, 52, 164);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;

    Row Driver() {
      return Row(
        children: [
          SizedBox(
            width: width * 0.1,
            height: width * 0.05,
            child: FloatingActionButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: width * 0.1,
            height: width * 0.05,
            child: FloatingActionButton(
                onPressed: () {},
                child: const Text('Edit',
                    style: TextStyle(color: Colors.blueAccent))),
          )
        ],
      );
    }

    Padding Driven() {
      return Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
              height: height * 0.05,
              width: width * 0.18,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text("Book"),
              )));
    }

    return Container(
      width: width * 0.8,
      height: height * 0.27,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: user.uid == driver ? light : dark,
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(10))),
      child: Column(
        children: [
          // Destination Details
          Text(destination,
              style: const TextStyle(
                  fontSize: 21,
                  fontFamily: AutofillHints.addressCityAndState,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Column with all the Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Driver's details
                  Row(
                    children: [
                      const Icon(
                        Icons.person_2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(driver, style: const TextStyle(color: Colors.white))
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  // Departure Location Details
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(location,
                          style: const TextStyle(color: Colors.white))
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                  // Date and Time Details
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('$date - $time',
                          style: const TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.white))
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                  // Available seats number
                  Row(
                    children: [
                      const Icon(Icons.chair, color: Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${availableSeats - passengers}",
                        style: TextStyle(
                            color: availableSeats > (availableSeats / 2)
                                ? Colors.white
                                : Colors.red),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cost,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      //This will contain the accept or cancel buttons
                      user.uid == driver ? Driver() : Driven()
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
