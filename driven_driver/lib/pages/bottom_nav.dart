import 'package:driven_driver/pages/booked.dart';
import 'package:driven_driver/pages/create_booking.dart';
import 'package:driven_driver/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 2;

  final tabs = <Widget>[
    const Center(
      child: Text("Chats Forum Screen"),
    ),
    const CreateBookingScreen(),
    const BookedScreen(),
    const Center(
      child: Text("Location Screen"),
    ),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color.fromRGBO(116, 52, 164, 0.8),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outlined),
                activeIcon: Icon(Icons.chat_bubble),
                label: "Chats"),
            BottomNavigationBarItem(
              icon: Icon(Icons.create_outlined),
              activeIcon: Icon(Icons.create),
              label: "Create Booking",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair_outlined),
              activeIcon: Icon(Icons.car_repair),
              label: "Rides",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.handshake_outlined,
                ),
                activeIcon: Icon(Icons.handshake),
                label: "My Offers"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              activeIcon: Icon(Icons.person_2),
              label: "Profile",
            ),
          ]),
    );
  }
}
