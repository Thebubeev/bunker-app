import 'package:bunker_app/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Text(
                'Добро пожаловать!',
                textAlign: TextAlign.center,
                style: titleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Text(
                  'Подробнее с правилами игры и функциями приложения вы можете ознакомиться в соотвествующих разделах меню',
                  textAlign: TextAlign.center,
                  style: usualText),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/menu');
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
                    'Продолжить',
                    style: bottomText,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
