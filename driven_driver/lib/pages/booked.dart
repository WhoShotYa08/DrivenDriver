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
                    'date': booking['date'],
                    'destination': booking['destination'],
                    'location': booking['location'],
                    'number': booking['numberOfPassenger'],
                    'owner_id': booking['owner_id'],
                    'time': booking['time']
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
                            BookedContainer(
                                passengers: lifts[index]['number'],
                                availableSeats: lifts[index]["availableSeats"],
                                driver: lifts[index]["owner_id"],
                                location: lifts[index]['location'],
                                destination: lifts[index]['destination'],
                                date: lifts[index]["date"],
                                time: lifts[index]["time"],
                                cost: lifts[index]['cost']),
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
