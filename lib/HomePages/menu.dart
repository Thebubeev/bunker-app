import 'package:bunker_app/AuthPages/Wrapper.dart';
import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                await auth.signOut().then(Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wrapper())));
                print('Signed Out!');
              } catch (e) {
                print(e);
              }
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('пользовательские соглашение', style: usualText),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8),
              elevation: 5.0,
              child: Padding(
                padding:
                    EdgeInsets.only(right: 70, left: 70, top: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Создать игру',
                      style: titleText,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Выберите подходящие настройки и начните новую игру',
                      style: usualText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: borderRad),
                        color: Colors.white,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: Text('Новая игра', style: bottomBlackText),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/lobby');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              margin: EdgeInsets.all(8),
              elevation: 5.0,
              child: Padding(
                padding:
                    EdgeInsets.only(right: 70, left: 70, top: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Присоединиться',
                      style: titleText,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Зайдите по ключу доступа в уже созданную игру',
                        style: usualText),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: borderRad),
                        color: Colors.black,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: Text('Войти', style: bottomText),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/join');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
