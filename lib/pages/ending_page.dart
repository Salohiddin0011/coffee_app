import 'package:coffee_app/pages/home_page.dart';
import 'package:coffee_app/service/constants/image_const.dart';
import 'package:coffee_app/service/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastPage extends StatelessWidget {
  const LastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CartController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.delivery),
            const SizedBox(height: 40),
            const Text(
              textAlign: TextAlign.center,
              "Uhu! Pedido confirmado",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFFC47E16),
              ),
            ),
            const SizedBox(height: 17.5),
            const Text(
              "Agora é só aguardar que logo o café chegará até você!",
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                controller.clearCoffee();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 65),
                alignment: Alignment.center,
                height: 55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF4B2894),
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
        ),
      ),
    );
  }
}
