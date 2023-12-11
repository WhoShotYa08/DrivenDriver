import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isVisible = true;

  // user email
  final user = FirebaseAuth.instance.currentUser!;

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  bool canUpdate = false;

  //Controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();

  Future addUserDetails(
    String username,
    String number,
  ) async {
    await FirebaseFirestore.instance
        .collection('Users/${user.uid}')
        .add({'Username': username, 'number': number});
  }

  //uneditable texfield
  InputDecoration cannotEdit() {
    return const InputDecoration(
      isCollapsed: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.none, color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none, color: Colors.grey)),
    );
  }

  //eiditable textfield
  InputDecoration canEdit() {
    return const InputDecoration(
      // isCollapsed: true,
      isDense: true,
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.5,
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
                    top: height * 0.25,
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
          Expanded(
              child: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('Users').snapshots(),
                builder: (context, snapshot) {
                  List userDetails = [];

                  if (snapshot.hasData) {
                    final details = snapshot.data?.docs.reversed.toList();
                    for (var person in details!) {
                      if (person.id == user.uid) {
                        userDetails.add(person.data());
                      }
                    }
                  }

                  return Column(
                    children: [
                      TextField(
                        controller: usernameController..text = userDetails[0]['Username']!,
                        readOnly: !canUpdate,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                        decoration: canUpdate ? canEdit() : cannotEdit(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: emailController..text = user.email!,
                        readOnly: false,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        decoration: canUpdate ? canEdit() : cannotEdit(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: numberController..text = userDetails[0]['number'],
                        readOnly: !canUpdate,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                        decoration: canUpdate ? canEdit() : cannotEdit(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.3,
                            ),
                            SizedBox(
                              width: width * 0.23,
                              child: FloatingActionButton(
                                  child: Text(canUpdate ? "Save" : "Update"),
                                  onPressed: () {
                                    if (canUpdate) {
                                      final doc = FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(user.uid);
                                      doc.update({
                                        "Username":
                                            usernameController.text.trim(),
                                        'number': numberController.text.trim()
                                      });
                                    }

                                    setState(() {
                                      canUpdate = !canUpdate;
                                    });
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          )),
        ],
      ),
    );
  }
}
