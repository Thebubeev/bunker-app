import 'dart:async';
import 'package:bunker_app/constants.dart';
import 'package:bunker_app/models/specialCards/storyCards/slideStoryCard.dart';
import 'package:bunker_app/models/specialCards/storyCards/storyCard.dart';
import 'package:bunker_app/models/specialCards/storyCards/storyCard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoryCardSlider extends StatefulWidget {
  @override
  _StoryCardSliderState createState() => _StoryCardSliderState();
}

class _StoryCardSliderState extends State<StoryCardSlider> {
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
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: storyCardList.length,
                      itemBuilder: (ctx, i) => StoryCardItem(i),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 35),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for (int i = 0; i < storyCardList.length; i++)
                                    if (i == _currentPage)
                                      SlideStoryCard(true)
                                    else
                                      SlideStoryCard(false)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
    );
  }
}
