import 'package:bunker_app/HomePages/GamePages/pages/featurePage.dart';
import 'package:bunker_app/HomePages/GamePages/pages/forthPage.dart';
import 'package:bunker_app/HomePages/GamePages/pages/secondPage.dart';
import 'package:bunker_app/HomePages/GamePages/pages/storyCardSlider.dart';
import 'package:bunker_app/constants.dart';
import 'package:flutter/material.dart';

class WrapperGamePage extends StatefulWidget {
  @override
  _WrapperGamePageState createState() => _WrapperGamePageState();
}

class _WrapperGamePageState extends State<WrapperGamePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FeaturePage(),
    SecondPage(),
    StoryCardSlider(),
    ForthPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('пользовательские соглашение', style: usualText),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 27,
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.unarchive,
                color: Colors.black,
              ),
              label: 'Vote'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Colors.black),
              label: 'Story of end of world'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  void onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
