import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isVisible = true;

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: _height * 0.55,
            child: Stack(
              children: <Widget>[
                Positioned(
                    width: _width,
                    child: Image(
                      height: _height * 0.35,
                      width: _width,
                      fit: BoxFit.cover,
                      image: const AssetImage("assets/images/second_try.png"),
                    )),
                Positioned(
                  top: _height * 0.05,
                  left: _width * 0.89,
                  child: GestureDetector(
                      onTap: logout,
                      child: const Icon(
                        Icons.logout_outlined,
                        size: 30,
                        color: Colors.red,
                      )),
                ),
                Positioned(
                    top: _height * 0.2,
                    left: _width * 0.32,
                    child: GestureDetector(
                        child: Container(
                      height: _width * 0.35,
                      width: _width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_width),
                          color: Colors.grey),
                      child: const Icon(
                        Icons.person_2_rounded,
                        size: 125,
                      ),
                    )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
