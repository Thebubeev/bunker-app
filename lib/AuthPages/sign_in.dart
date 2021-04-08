import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:bunker_app/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  GoogleSignIn googleAuth = GoogleSignIn();
  bool loading = false;

  // text field state
  String name, email, password;
  String _warning;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: Text(
                'Назад',
                textAlign: TextAlign.left,
              ),
            ),
            body: Column(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'Вход',
                          style: titleText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        showAlert(),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Gilroy'),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Введите email';
                            } else if (!val.contains('@')) {
                              return 'Введите действительный email';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Пароль',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Gilroy'),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          validator: (String val) {
                            if (val.isEmpty) {
                              return 'Введите пароль';
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState
                                  .validate()) /* Автоматически обновляет состояние */ {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                try {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                  print('Signed in with New ID $result');
                                } catch (e) {
                                  print(e);
                                  _warning = 'Вы ввели неверные данные';
                                  /*   Fluttertoast.showToast(
                                      msg: "Вы ввели неверные данные!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0); */
                                  setState(() => loading = false);
                                }
                              }
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
                                'Войти',
                                style: bottomText,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          height: 35,
                          padding: EdgeInsets.only(left: 19, right: 19),
                          child: Material(
                            borderRadius: borderRad,
                            shadowColor: Colors.greenAccent,
                            color: Colors.amber,
                            elevation: 7.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ImageIcon(
                                    AssetImage(
                                        'assets/images/free-icon-google-300221.png'),
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    try {
                                      googleAuth.signIn().then((result) {
                                        result.authentication.then((googleKey) {
                                          FirebaseAuth.instance
                                              .signInWithCredential(
                                                  GoogleAuthProvider
                                                      .getCredential(
                                                          idToken:
                                                              googleKey.idToken,
                                                          accessToken: googleKey
                                                              .accessToken))
                                              .then((signedInUser) {
                                            print(
                                                'Signed in as ${signedInUser.displayName}');
                                            Navigator.of(context)
                                                .pushReplacementNamed('/home');
                                          }).catchError((e) {
                                            print(e);
                                          });
                                        }).catchError((e) {
                                          print(e);
                                        });
                                      }).catchError((e) {
                                        print(e);
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      child: Text(
                                        'Войти через Google аккаунт',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FlatButton(
                          child: Text('Забыли пароль?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy')),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/forgot');
                          },
                        ),
                      ],
                    ),
                  )),
            ]),
          );
  }

  Widget showAlert() {
    if (_warning != null) {
      return Container(
        color: Colors.redAccent,
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Text(
                _warning,
                style: TextStyle(
                    fontSize: 18, fontFamily: 'Gilroy', color: Colors.white),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _warning = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(height: 0);
  }
}
