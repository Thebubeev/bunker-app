import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  bool isActive;
  Slide(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      child: Text(''),
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
