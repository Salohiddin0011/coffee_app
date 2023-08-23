import 'package:coffee_app/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../data/models/cart.dart';

class CoffeeMenu extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final double price;
  final CoffeeModel coffee;
  const CoffeeMenu(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.price,
      required this.coffee});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(coffee: coffee)));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffF3F2F2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(36),
            bottomRight: Radius.circular(6),
            bottomLeft: Radius.circular(36),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(-1, -1),
              color: Colors.black.withOpacity(.3),
            ),
            const BoxShadow(
              blurRadius: 2,
              offset: Offset(1, 1),
              color: Colors.white,
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Transform.scale(
                  scale: 1.7,
                  child: Image.asset(
                    image,
                    height: 60,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Color(0xff403937),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffC47F17),
                            ),
                            children: [
                              const TextSpan(text: "R\$ "),
                              TextSpan(
                                text: price.toString(),
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffC47F17),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
