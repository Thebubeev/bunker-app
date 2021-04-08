import 'package:bunker_app/constants.dart';
import 'package:bunker_app/models/specialCards/specialCard.dart';
import 'package:flutter/material.dart';

class SpecialCardItem extends StatelessWidget {
  final int index;
  SpecialCardItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      specialCardList[index].description,
                      style: usualText,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                      height: 20,
                      width: 130,
                      child: Center(
                          child: Text(
                        'Использовать',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
