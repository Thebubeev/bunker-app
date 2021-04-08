import 'package:bunker_app/constants.dart';
import 'package:bunker_app/models/specialCards/storyCards/storyCard.dart';
import 'package:flutter/material.dart';

class StoryCardItem extends StatelessWidget {
  final int index;
  StoryCardItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        /* Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20, left: 35),
          child: Container(
            child: Text(
              storyCardList[index].title,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
            ),
          ),
        ),*/
        Container(
            child: Padding(
          padding: EdgeInsets.only(bottom: 10, top: 5),
          child: Image(
            image: AssetImage(storyCardList[index].imageUrl),
            fit: BoxFit.cover,
            height: 200,
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            storyCardList[index].title,
            style: titleText,
          ),
        ),
        Text(
          storyCardList[index].description,
          style: usualText,
        ),
      ],
    ));
  }
}
