import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final Function? onPress;

  @override
 Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: Container(width: 50.0,height: 70.0,padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
