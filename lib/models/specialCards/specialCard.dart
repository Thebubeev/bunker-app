import 'package:flutter/material.dart';

class SpecialCard {
  String description;
  SpecialCard({
    @required this.description,
  });
}

final specialCardList = [
  SpecialCard(
      description:
          'Ты можешь поменять свою характеристику "Дополнительная информация" на любую другую'),
  SpecialCard(description: 'Количество мест в бункере на 1 больше'),
];
