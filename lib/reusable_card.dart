import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.cardColor, this.cardChild, required this.onTapGesture()});
  final Color cardColor;
  final Widget? cardChild;
  final Function onTapGesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapGesture();
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: cardChild,
    ),);
  }
}