import 'package:coffee_app/pages/ending_page.dart';
import 'package:coffee_app/service/controllers/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Valor total',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Consumer<CartController>(
                      builder: (context, controller, child) {
                        return Text(
                          "R\$ ${controller.cart.total.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        );
                      },
                    )
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LastPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffC47F17),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "confirmar pedido".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          )),
      appBar: AppBar(
        title: const Text(
          'Carrinho',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: Provider.of<CartController>(context).cart.items.length,
        itemBuilder: (context, index) {
          final cartItem =
              Provider.of<CartController>(context).cart.items[index];
          return Consumer<CartController>(
              builder: (context, controller, child) {
            return ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Transform.scale(
                  scale: 1.2,
                  child: Image(
                    image: AssetImage(cartItem.coffee.image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItem.coffee.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "R\$ ${cartItem.coffee.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.grey.withOpacity(.4),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.addToCard(
                              coffee: cartItem.coffee,
                              quantity: -1,
                            );
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Color(0xff8047F8),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Consumer<CartController>(
                            builder: (context, controller, child) {
                          return Text(
                            cartItem.quantity.toString(),
                            style: const TextStyle(fontSize: 16),
                          );
                        }),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            controller.addToCard(
                              coffee: cartItem.coffee,
                              quantity: 1,
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0xff8047F8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.removeCoffee(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7.5))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.trash,
                          color: Color(0xff8047F8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
