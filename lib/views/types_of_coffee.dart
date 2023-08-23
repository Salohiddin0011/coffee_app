import 'package:flutter/material.dart';

class TypesOfCoffee extends StatelessWidget {
  final String text;
  const TypesOfCoffee({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.6,
            color: Color(0xff8047F8),
          ),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xff4B2995),
        ),
      ),
    );
  }
}
