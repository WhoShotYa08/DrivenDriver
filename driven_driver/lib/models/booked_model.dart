import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookedContainer extends StatelessWidget {
  int availableSeats;
  int passengers;
  Timestamp dateTime;
  String cost;
  String departureStreet;
  String departureTown;
  String destinationStreet;
  String destinationTown;
  String driver;
  String lift_id;

  BookedContainer(
      {super.key,
      required this.passengers,
      required this.availableSeats,
      required this.driver,
      required this.departureStreet,
      required this.departureTown,
      required this.destinationStreet,
      required this.destinationTown,
      required this.dateTime,
      required this.cost,
      required this.lift_id});

  // user email
  final user = FirebaseAuth.instance.currentUser!;

  final Color light = const Color.fromARGB(255, 209, 164, 243);
  final Color dark = const Color.fromARGB(225, 116, 52, 164);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;

    Row _driver() {
      return Row(
        children: [
          SizedBox(
            width: width * 0.1,
            height: width * 0.05,
            child: FloatingActionButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("Lifts")
                      .doc(lift_id)
                      .delete();
                },
                child: const Text(
                  'Delete',
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

    Padding _driven() {
      return Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
              height: height * 0.05,
              width: width * 0.18,
              child: FloatingActionButton(
                onPressed: () {
                  if (availableSeats >= 0) {
                    final data = FirebaseFirestore.instance
                        .collection('Lifts')
                        .doc(lift_id);

                    data.update({
                      'numberOfPassenger': passengers + 1,
                    });
                  } else {
                    print('no more seats available');
                  }
                },
                child: const Text("Book"),
              )));
    }

    return Container(
      width: width * 0.8,
      height: height * 0.35,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: user.uid == driver ? light : dark,
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(10))),
      child: Column(
        children: [
          // Destination Details
          Row(
            children: [
              Text(destinationStreet,
                  style: const TextStyle(
                      fontSize: 21,
                      fontFamily: AutofillHints.addressCityAndState,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Text(",",
                  style: TextStyle(
                      fontSize: 21,
                      fontFamily: AutofillHints.addressCityAndState,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(
                width: 5,
              ),
              Text(destinationTown,
                  style: const TextStyle(
                      fontSize: 21,
                      fontFamily: AutofillHints.addressCityAndState,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),

          const SizedBox(
            height: 7,
          ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(departureStreet,
                              style: const TextStyle(color: Colors.white)),
                          Text(departureTown,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      )
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
                      Text(dateTime.toDate().toString(),
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
                        "$availableSeats /",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${availableSeats - passengers}",
                        style: TextStyle(
                            color: passengers <= availableSeats / 2
                                ? Colors.white
                                : Colors.red),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Price Tag as well the necessary buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  cost,
                  style: const TextStyle(
                      fontSize: 31, fontWeight: FontWeight.bold),
                ),
              ),

              //This will contain the accept or cancel buttons
              user.uid == driver ? _driver() : _driven()
            ],
          )
        ],
      ),
    );
  }
}
