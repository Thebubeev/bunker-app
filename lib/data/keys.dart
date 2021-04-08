import 'package:flutter/material.dart';

class Key {
  int key;
  Key({@required this.key});
}

class KeyData {
  final _key = [
    Key(key: 12312),
    Key(key: 53255),
    Key(key: 12441),
    Key(key: 75476),
  ];

  List<Key> get keys => [..._key];
}
