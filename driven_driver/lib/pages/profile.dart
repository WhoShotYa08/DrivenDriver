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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.55,
            child: Stack(
              children: <Widget>[
                Positioned(
                    width: width,
                    child: Image(
                      height: height * 0.35,
                      width: width,
                      fit: BoxFit.cover,
                      image: const AssetImage("assets/images/second_try.png"),
                    )),
                Positioned(
                  top: height * 0.05,
                  left: width * 0.89,
                  child: GestureDetector(
                      onTap: logout,
                      child: const Icon(
                        Icons.logout_outlined,
                        size: 30,
                        color: Colors.red,
                      )),
                ),
                Positioned(
                    top: height * 0.2,
                    left: width * 0.32,
                    child: GestureDetector(
                        child: Container(
                      height: width * 0.35,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width),
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
