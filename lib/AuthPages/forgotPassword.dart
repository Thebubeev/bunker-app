import 'package:bunker_app/AuthPages/sign_in.dart';
import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:bunker_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
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
                          'Забыли пароль',
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
                        showForgotPassword(),
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState
                                  .validate()) /* Автоматически обновляет состояние */ {
                                setState(() => loading = true);
                                  dynamic uid =
                                      await _auth.sendPasswordResetEmail(email);
                                try {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/forgot');
                                  Fluttertoast.showToast(
                                      msg:
                                          "На почту $email пришло уведомление для восстановление пароля!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 100,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 18.0);
                                  print('Password reset email sent $uid');
                                } catch (e) {
                                  print(e);
                                  _warning = 'Вы ввели неверные данные';
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
                                'Отправить',
                                style: bottomText,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]),
          );
  }

  Widget showForgotPassword() {
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
