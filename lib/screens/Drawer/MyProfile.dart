// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/Drawer/Widgets/InfoCard.dart';
import 'package:flutter_application_1/screens/components/LoggedIn.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

const url = "meetmulik.com";
const email = "meetmulik@gmail.com";
const phone = "1234567899";
const location = "Mumbai, India";

class _MyProfileState extends State<MyProfile> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Profile"),
        ),
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return LoggedIn();
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            } else {
              return SafeArea(
                minimum: const EdgeInsets.only(top: 100),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user?.photoURL ?? ""),
                    ),
                    Text(
                      "Web Developer",
                      style: GoogleFonts.roboto(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.teal,
                        ),
                        title: Text(
                          user?.displayName ?? "Test",
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal,
                        ),
                        title: Text(
                          user?.email ?? "Test",
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
