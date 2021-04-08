import 'package:bunker_app/Services/DatabaseManager.dart';
import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:bunker_app/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  String name, email, password, confirmPassword, _warning;

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
                          'Регистрация',
                          style: titleText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              showAlert(),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Имя',
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
                              return 'Введите свое имя';
                            } else if (val.length < 2) {
                              return 'Ваше имя должен содержать не менее 2 символов';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                        ),
                        SizedBox(
                          height: 10.0,
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
                          height: 10.0,
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
                            confirmPassword = val;
                            if (val.isEmpty) {
                              return 'Введите пароль';
                            } else if (val.length < 6) {
                              return 'Пароль должен содержать не менее 6 символов';
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
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Подтвердите пароль',
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
                              return 'Введите пароль повторно';
                            } else if (val.length < 6) {
                              return 'Пароль должен содержать не менее 6 символов';
                            } else if (val != confirmPassword) {
                              return "Пароль должен быть таким же как и сверху";
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
                                    await _auth.createUserWithEmailAndPassword(
                                        email, password, name);
                                try {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                  print('Signed up with New ID $result');
                                } catch (e) {
                                  print(e);
                                  _warning = 'Вы ввели неверные данные';
                                  setState(() {
                                    loading = false;
                                  });
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
                                'Зарегистрироваться',
                                style: bottomText,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
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
