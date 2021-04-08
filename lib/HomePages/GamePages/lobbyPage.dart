import 'dart:developer';
import 'dart:math';

import 'package:bunker_app/Services/DatabaseManager.dart';
import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:bunker_app/data/keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final globalKey = new GlobalKey<ScaffoldState>();
  AuthService auth = AuthService();
  int index = 0;
  final KeyData data = KeyData();
  Firestore firestore = Firestore.instance;

  List userProfilesList = [];

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  String userID = '';

  fetchUserInfo() async {
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    userID = getUser.uid;
  }

  void fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();
    if (resultant == null) {
      print('Enable to retrieve data');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  updateData(
      String name,
      String gender,
      String profession,
      String phobia,
      String humanQuality,
      String health,
      String hobby,
      String additionalSkill,
      String baggage,
      String uid) async {
    await DatabaseManager().updateUserList(name, gender, profession, phobia,
        humanQuality, health, hobby, additionalSkill, baggage, userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/menu');
          },
        ),
        title: Text('Покинуть игру'),
        actions: [
          TextButton(
            onLongPress: () {
              Clipboard.setData(
                  new ClipboardData(text: data.keys[index].key.toString()));
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text("Скопировано"),
              ));
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.copy,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: GestureDetector(
                    child: new Text(
                      data.keys[index].key.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: userProfilesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    userProfilesList[index]['name'],
                    style: usualText,
                  ),
                  leading: Icon(Icons.person),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () async {
                updateData('hello', "it's", 'me', null, null, null, null, null,
                    null, null);
                Navigator.pushNamed(context, '/wrapper');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: Colors.black,
                ),
                height: 80,
                width: 340,
                child: Center(
                    child: Text(
                  'Начать игру',
                  style: bottomText,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
