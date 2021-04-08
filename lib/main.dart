import 'package:bunker_app/AuthPages/Wrapper.dart';
import 'package:bunker_app/AuthPages/forgotPassword.dart';
import 'package:bunker_app/AuthPages/register.dart';
import 'package:bunker_app/AuthPages/sign_in.dart';
import 'package:bunker_app/HomePages/GamePages/joinPage.dart';
import 'package:bunker_app/HomePages/GamePages/lobbyPage.dart';
import 'package:bunker_app/HomePages/GamePages/pages/featurePage.dart';
import 'package:bunker_app/HomePages/GamePages/pages/storyCardSlider.dart';
import 'package:bunker_app/HomePages/GamePages/pages/testSlider.dart';
import 'package:bunker_app/HomePages/GamePages/wrapperGamePage.dart';
import 'package:bunker_app/HomePages/home.dart';
import 'package:bunker_app/HomePages/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        initialRoute: '/main',
        routes: {
          '/main': (context) => Wrapper(),
          '/signIn': (context) => SignIn(),
          '/signUp': (context) => Register(),
          '/home': (context) => Home(),
          '/menu': (context) => Menu(),
          '/lobby': (context) => LobbyPage(),
          '/forgot': (context) => ForgotPassword(),
          '/join': (context) => JoinPage(),
          '/feature': (context) => FeaturePage(),
          '/wrapper': (context) => WrapperGamePage(),
          '/test': (context) => GettingStartedScreen(),
          '/story': (context) => StoryCardSlider(),
        });
  }
}
