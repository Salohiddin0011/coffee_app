import 'package:coffee_app/service/constants/ic_const.dart';
import 'package:coffee_app/service/constants/image_const.dart';
import 'package:coffee_app/service/controllers/cart_controller.dart';
import 'package:coffee_app/views/ammount_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/cart.dart';
import 'cart_page.dart';

class DetailPage extends StatefulWidget {
  final CoffeeModel coffee;
  const DetailPage({super.key, required this.coffee});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 1;
  List<String> ammount = ['114ml', '140ml', '227ml'];
  int expression = 0;
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CartController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: const Color(0xff272221),
        title: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          Consumer<CartController>(builder: (context, controll, child) {
            return Badge(
              backgroundColor: const Color(0xff8147F8),
              alignment: const Alignment(0.3, -0.5),
              label: Text("${controll.cart.items.length}"),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    if (controll.cart.items.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const CartPage()));
                    }
                  },
                  child: Image.asset(
                    AppIcons.cart,
                    color: const Color(0xff8147F8),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Color(0xff272221),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7.5, horizontal: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xff403938),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Text(
                      widget.coffee.category.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.coffee.title,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
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
                              text: widget.coffee.price.toString(),
                              style: const TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    widget.coffee.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xffD7D5D5),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(AppImages.coffee),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selecione o tamanho:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      for (int i = 0; i < ammount.length; i++)
                        AmmountView(
                            ammount: ammount[i],
                            i: i,
                            selectedIndex: selectedIndex,
                            onPressed: () {
                              selectedIndex = i;
                              setState(() {});
                            })
                    ],
                  ),
                  const Spacer(),
                  SafeArea(
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.addToCard(
                                  coffee: widget.coffee, quantity: -1);
                              if (expression > 0) {
                                expression--;
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xff8047F8),
                            ),
                          ),
                          Consumer<CartController>(builder: (context, cont, _) {
                            return Text(
                              '$expression',
                              style: const TextStyle(fontSize: 15),
                            );
                          }),
                          IconButton(
                            onPressed: () {
                              controller.addToCard(
                                  coffee: widget.coffee, quantity: 1);
                              expression++;
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xff8047F8),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Color(0xff4B2995),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(
                                  'Adicionar'.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
