// import 'package:driven_driver/models/booked_model.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class BookingContent extends StatefulWidget {
//   const BookingContent({super.key});

//   @override
//   State<BookingContent> createState() => _BookingContentState();
// }

// class _BookingContentState extends State<BookingContent> {
//   final searchController = TextEditingController();
//   String result = '';
//   @override
//   Widget build(BuildContext context) {
//     DatabaseReference lifts = FirebaseDatabase.instance.ref().child("");
//     return Scaffold(
//       body: Column(children: [
//         Padding(
//             padding: const EdgeInsets.all(16),
//             child: Container(
//               child: Stack(
//                 children: [
//                   TextField(
//                     controller: searchController,
//                     onChanged: (val) {
//                       setState(() {
//                         result = val;
//                       });
//                     },
//                     decoration: const InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey)),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey)),
//                         hintText: "Search Destination",
//                         hintStyle: TextStyle(color: Colors.grey)),
//                   ),
//                 ],
//               ),
//             )),
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: BookedContainer(
//               availableSeats: 4,
//               passengers: 0,
//               cost: "R125",
//               driver: "Adrian The Flippin Don",
//               location: "84 Albertina Sizulu Rd, 2000",
//               destination: "22A Cavendish Rd, Bellevue East, 2198",
//               date: "15/12/2023",
//               time: "12:00"),
//         )
//       ]),
//     );
//   }
// }
