import 'dart:convert';
import 'dart:math';

import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Random rnd = Random();
  final globalKey = new GlobalKey<ScaffoldState>();
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              // Decode Json
              var mydata = JsonDecoder().convert(snapshot.data.toString());
              return ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, top: 20, left: 15, right: 10),
                        child: Container(
                          child: Text(
                            'Игроки',
                            style: titleText,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          height: 20,
                          width: 80,
                          child: Center(
                              child: Text(
                            'Голосовать',
                            style:
                                TextStyle(fontFamily: 'Gilroy', fontSize: 15),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _card(String subtitle, String title, Icon icons) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              icons,
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 15, fontFamily: 'Gilroy'),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy'),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
