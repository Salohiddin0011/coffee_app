import 'package:coffee_app/data/models/cart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarouselItemView extends StatelessWidget {
  List<CoffeeModel> allCoffes;
  int i;
  CarouselItemView({super.key, required this.allCoffes, required this.i});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-3.2, -5),
      child: Container(
        height: 260,
        width: 210,
        decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(36),
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(6),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(1, 1),
              color: Colors.black.withOpacity(.3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: Column(
            children: [
              Transform.scale(
                scale: 2,
                child: Image.asset(
                  allCoffes[i].image,
                  height: 70,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffEBE5F9),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Text(
                    allCoffes[i].category.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4B2995),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  allCoffes[i].title,
                  style: const TextStyle(
                    color: Color(0xff403937),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                allCoffes[i].description,
                style: const TextStyle(color: Color(0xff8D8686)),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffDBAC2C),
                  ),
                  children: [
                    const TextSpan(text: "R\$ "),
                    TextSpan(
                      text: allCoffes[i].price.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
