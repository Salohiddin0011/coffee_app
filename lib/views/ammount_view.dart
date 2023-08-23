import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AmmountView extends StatelessWidget {
  final String ammount;
  int i;
  int selectedIndex;
  void Function() onPressed;
  AmmountView(
      {super.key,
      required this.ammount,
      required this.i,
      required this.selectedIndex,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 5, left: 5),
          height: 50,
          decoration: BoxDecoration(
              color:
                  selectedIndex == i ? Colors.white : const Color(0xffEDEDED),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: selectedIndex == i
                  ? Border.all(color: const Color(0xff8047F8), width: 1.5)
                  : null),
          child: Text(
            ammount,
            style: selectedIndex == i
                ? const TextStyle(
                    color: Color(0xff8047F8),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )
                : const TextStyle(
                    color: Color(0xff574F4D),
                  ),
          ),
        ),
      ),
    );
  }
}
