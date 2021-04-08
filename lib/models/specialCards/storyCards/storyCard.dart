import 'package:flutter/material.dart';

class StoryCard {
  final String buttonText;
  final String imageUrl;
  final String title;
  final String description;

  StoryCard({
    this.buttonText,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final storyCardList = [
  StoryCard(
      description:
          'В результате применения химикатов серьзно изменился экологический баланс. Нарушен микробиологический состав почвы, отравлены растения. После выхода из бункера останется малая часть животных и растения, вода и почва заражены, оставшееся население - 10 %.',
      imageUrl: 'assets/images/unnamed.jpg',
      title: 'Химическая война'),
  StoryCard(
      description:
          'На диаграммы связей представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны бть подвергнуты целой серии независимых исследований. Значимость этих проблем настолько очевидца, что убежденность некоторых оппонентов требует от нас анализа модели развития.',
      imageUrl: 'assets/images/bunker.jpg',
      title: 'Бункер "К-20" под землей'),
];
