import 'dart:convert';
import 'dart:math';
import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FeaturePage extends StatefulWidget {
  @override
  _FeaturePageState createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
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
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 20, left: 15, right: 10),
                    child: Container(
                      child: Text(
                        'Ваши характеристики',
                        style: titleText,
                      ),
                    ),
                  ),
                  _card(
                      'Профессия',
                      'Врач',
                      Icon(
                        Icons.person,
                      )),
                  _card(
                      'Фобия',
                      'Клаустрафобия',
                      Icon(
                        Icons.person,
                        size: 30,
                      )),
                  _card('Человеческое качество', 'Доброта', Icon(Icons.person)),
                  _card('Состояние здоровья', 'Абсолютно здоров',
                      Icon(Icons.person)),
                  _card('Хобби', 'Рыбалка', Icon(Icons.person)),
                  _card('Дополнительный навык', 'Знание немецкого языка',
                      Icon(Icons.person)),
                  _card('Биология', 'Мужчина 18 лет', Icon(Icons.person)),
                  _card('Ориентация', 'Гетеросексуал', Icon(Icons.person)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FlatButton(
                      child: Container(
                        child: Center(
                          child: Text(
                            'Ваши специальные карты',
                            style: bottomBlackText,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                          color: Colors.black12,
                        ),
                        width: 250,
                        height: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/test');
                      },
                    ),
                  )
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
