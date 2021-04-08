import 'package:flutter/cupertino.dart';

class User {
  final String gender;
  final String profession;
  final String phobia;
  final String humanQuality;
  final String health;
  final String hobby;
  final String additionalSkill;
  final String baggage;

  User(
      {@required this.gender,
      @required this.profession,
      @required this.phobia,
      @required this.humanQuality,
      @required this.health,
      @required this.hobby,
      @required this.additionalSkill,
      @required this.baggage});
}

class UserData {
  final _user = [
    User(
        gender: 'Мужчина',
        profession: 'Пожарный',
        phobia: 'Клаустрофобия',
        humanQuality: 'Веселый',
        health: 'Полностью здоров',
        hobby: 'Любит играть в футбол',
        additionalSkill: 'Видел президента',
        baggage: 'Нож'),
    User(
        gender: 'Мужчина',
        profession: 'Военный',
        phobia: 'Гомофобия',
        humanQuality: 'Умный',
        health: 'Частично здоров',
        hobby: 'Любит мастурбировать',
        additionalSkill: 'Есть шестой палец',
        baggage: 'Коробок спичек'),
    User(
        gender: 'Мужчина',
        profession: 'Слесарь',
        phobia: 'Русофобия',
        humanQuality: 'Добрый',
        health: 'Полностью здоров',
        hobby: 'Любит играть в баскетбол',
        additionalSkill: 'Знает немецкий',
        baggage: 'Телефон')
  ];

  List<User> get users => [..._user];
}
