import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_app/data/datas/datas.dart';
import 'package:coffee_app/pages/cart_page.dart';

import 'package:coffee_app/service/constants/ic_const.dart';
import 'package:coffee_app/service/controllers/cart_controller.dart';
import 'package:coffee_app/views/carousel_item_view.dart';
import 'package:coffee_app/views/coffee_menu_view.dart';
import 'package:coffee_app/views/types_of_coffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CoffeeModel> traditionals = Datas.select(CoffeeType.tradicionais);
  List<CoffeeModel> doces = Datas.select(CoffeeType.doces);
  List<CoffeeModel> especials = Datas.select(CoffeeType.especiais);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff272221),
        centerTitle: false,
        title: const Row(
          children: [
            SizedBox(width: 20),
            Icon(
              CupertinoIcons.location_solid,
              color: Colors.purple,
            ),
            SizedBox(width: 7.5),
            Text(
              'Porto Alegre, RS',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Consumer<CartController>(builder: (context, controll, child) {
            return Badge(
              alignment: const Alignment(0.3, -0.5),
              label: Text("${controll.cart.items.length}"),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                    onTap: () {
                      if (controll.cart.items.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CartPage()));
                      }
                    },
                    child: Image.asset(AppIcons.cart)),
              ),
            );
          }),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff272221),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Encontre o café perfeito para qualquer hora do dia',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Transform.scale(
                        scale: 1.3,
                        child: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      filled: true,
                      hintText: 'Pesquisar',
                      hintStyle: const TextStyle(color: Colors.grey),
                      isDense: true,
                      fillColor: const Color(0xff403938),
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      focusedErrorBorder: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  clipBehavior: Clip.none,
                  height: 300,
                  viewportFraction: 0.6,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  for (int i = 0; i < traditionals.length; i++)
                    CarouselItemView(allCoffes: traditionals, i: i),
                  for (int i = 0; i < doces.length; i++)
                    CarouselItemView(allCoffes: doces, i: i),
                  for (int i = 0; i < especials.length; i++)
                    CarouselItemView(allCoffes: especials, i: i)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220, left: 32, right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nossos cafés',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff574F4D)),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        TypesOfCoffee(text: 'traditionals'),
                        TypesOfCoffee(text: 'doces'),
                        TypesOfCoffee(text: 'especiais'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tradicionais',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < traditionals.length; i++)
                          CoffeeMenu(
                            title: traditionals[i].title,
                            subtitle: traditionals[i].description,
                            image: traditionals[i].image,
                            price: traditionals[i].price,
                            coffee: traditionals[i],
                          )
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Doces',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < doces.length; i++)
                          CoffeeMenu(
                            title: doces[i].title,
                            subtitle: doces[i].description,
                            image: doces[i].image,
                            price: doces[i].price,
                            coffee: doces[i],
                          )
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Especials',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < especials.length; i++)
                          CoffeeMenu(
                            title: especials[i].title,
                            subtitle: especials[i].description,
                            image: especials[i].image,
                            price: especials[i].price,
                            coffee: especials[i],
                          )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
