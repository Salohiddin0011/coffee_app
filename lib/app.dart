import 'package:coffee_app/pages/home_page.dart';
import 'package:coffee_app/service/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartController>(
            create: (context) => CartController()),
      ],
      child: const HomePage(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.light,
        home: child,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
