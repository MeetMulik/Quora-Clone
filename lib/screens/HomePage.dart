// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/Drawer/BookmarksScreen.dart';
import 'package:flutter_application_1/screens/Drawer/MyProfile.dart';
import 'package:flutter_application_1/screens/Drawer/QuestionsScreen.dart';
import 'package:flutter_application_1/screens/HomePages/ChatScreen.dart';
import 'package:flutter_application_1/screens/HomePages/HomeScreen.dart';
import 'package:flutter_application_1/screens/HomePages/LikedScreen.dart';
import 'package:flutter_application_1/screens/HomePages/ProfileScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Liked"),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ]),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          HomeScreen(),
          LikedScreen(),
          ChatScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }),
        items: _bottomNavigationBarItems,
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(
        top: 80,
      ),
    );

Widget buildMenuItems(BuildContext context) => Container(
      child: Wrap(
        runSpacing: 5,
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyProfile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text("Bookmarks"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BookmarksScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("Questions"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QuestionsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyProfile()));
            },
          ),
        ],
      ),
    );
