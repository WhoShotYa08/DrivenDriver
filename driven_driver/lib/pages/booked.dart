import 'package:driven_driver/models/booked_content.dart';
import 'package:driven_driver/models/booked_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({super.key});

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  // user email
  final user = FirebaseAuth.instance.currentUser!;

  final searchController = TextEditingController();

  late String result = "";

  List<dynamic> getSearchOutput(List inputList) {
    List outputList = inputList
        .where((element) => element['destination'].toString().contains(result))
        .toList();

    return outputList;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        SizedBox(height: height * 0.02),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: searchController,
            onChanged: (val) {
              setState(() {
                result = val;
              });
            },
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: "Search Destination",
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),

        //rebuild for every new event #read about StreamBuilder<QuerySnapshot>
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Lifts').snapshots(),
            builder: (context, snapshot) {
              List lifts = [];

              if (snapshot.hasData) {
                final bookings = snapshot.data?.docs.reversed.toList();
                for (var booking in bookings!) {
                  Object liftsDetails = {
                    'availableSeats': booking['availableSeats'],
                    'cost': booking['costShareDescription'],
                    'dateTime': booking['departureDateTime'],
                    'destinationSteet': booking['destinationStreet'],
                    'destinationTown': booking['destinationTown'],
                    'locationStreet': booking['departureStreet'],
                    'locationTown': booking['departureTown'],
                    'number': booking['numberOfPassenger'],
                    'owner_id': booking['owner_id'],
                    'lift_id': booking['lift_id']
                  };
                  lifts.add(liftsDetails);
                }
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: lifts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            lifts[index]['destinationSteet']
                                        .toLowerCase()
                                        .contains(result.toLowerCase()) ||
                                    lifts[index]['destinationTown']
                                        .toLowerCase()
                                        .contains(result.toLowerCase())
                                ? BookedContainer(
                                    passengers: lifts[index]['number'],
                                    availableSeats: lifts[index]
                                        ["availableSeats"],
                                    driver: lifts[index]["owner_id"],
                                    departureStreet: lifts[index]
                                        ['locationStreet'],
                                    departureTown: lifts[index]['locationTown'],
                                    destinationStreet: lifts[index]
                                        ['destinationSteet'],
                                    destinationTown: lifts[index]
                                        ['destinationTown'],
                                    dateTime: lifts[index]['dateTime'],
                                    cost: lifts[index]['cost'],
                                    lift_id: lifts[index]['lift_id'],
                                  )
                                : const Text(''),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    }),
              );
            })
      ]),
    );
  }
}
