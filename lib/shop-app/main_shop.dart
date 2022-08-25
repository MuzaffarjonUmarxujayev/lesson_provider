import 'package:flutter/material.dart';
import 'package:lesson_provider/shop-app/pages/home/home_page.dart';
import 'package:lesson_provider/shop-app/pages/main/main_page.dart';
import 'package:provider/provider.dart';

import 'pages/order/order_provider.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderProvider(),
      child: MaterialApp(
        home: const MainPage(),
        routes: {
          HomePage.id: (context) => const HomePage(),
          MainPage.id: (context) => const MainPage(),
        },
      ),
    );
  }
}
