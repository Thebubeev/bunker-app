import 'dart:async';
import 'package:bunker_app/constants.dart';
import 'package:bunker_app/models/specialCards/slide.dart';
import 'package:bunker_app/models/specialCards/specialCard.dart';
import 'package:bunker_app/models/specialCards/specialCard_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white, // transparent status bar
          systemNavigationBarColor: Colors.white, // navigation bar color
          statusBarIconBrightness: Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:
              Brightness.dark, //navigation bar icons' color
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Назад'),
            leading: IconButton(
              icon: Icon(Icons.undo),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/wrapper');
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 10, right: 10, left: 10),
                    child: Container(
                      child: Text(
                        'Специальные карты',
                        style: titleText,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: <Widget>[
                        PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          itemCount: specialCardList.length,
                          itemBuilder: (ctx, i) => SpecialCardItem(i),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 30),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 35),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    for (int i = 0;
                                        i < specialCardList.length;
                                        i++)
                                      if (i == _currentPage)
                                        Slide(true)
                                      else
                                        Slide(false)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
