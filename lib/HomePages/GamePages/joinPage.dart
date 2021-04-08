import 'package:bunker_app/Services/auth.dart';
import 'package:bunker_app/constants.dart';
import 'package:bunker_app/data/keys.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  var key;
  int index = 0;
  final KeyData data = KeyData();
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Назад'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.undo),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/menu');
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 18, top: 25),
            child: Text(
                'Введите код доступа от комнату, в которую вы хотите войти',
                style: usualText),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 140, left: 36, right: 36, bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Код доступа',
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
                        return 'Код доступа не должен быть пустым';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() => key = val);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      if (key == data.keys[index].key.toString()) {
                        Navigator.pushNamed(context, '/lobby');
                      } else {
                        Fluttertoast.showToast(
                            msg: "Ключ введен неверно!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 60,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
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
                        'Присоединиться',
                        style: bottomText,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
