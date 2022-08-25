import 'package:flutter/material.dart';
import 'package:lesson_provider/shop-app/models/category_model.dart';
import 'package:lesson_provider/shop-app/models/product_model.dart';
import 'package:lesson_provider/shop-app/pages/detail/datail_page.dart';
import 'package:lesson_provider/shop-app/services/mock_data.dart';
import '../order/order_page.dart';
import 'package:lesson_provider/shop-app/pages/order/order_page.dart';

class ProductsProvider extends ChangeNotifier {
  final String categoryId;
  late Category category;

  ProductsProvider({required this.categoryId}) {
    getCategory();
    getProducts();
  }

  void getCategory() {
    category = Category.fromJson(categoriesMock.firstWhere((category) => categoryId == category["id"]));
  }

  void getProducts() {
    category.products = productsMock.where((product) => product["categoryId"] == categoryId)
        .map((product) => Product.fromJson(product)).toList();
  }



  void onTapBasket({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
  }

  void openDetailPage({required BuildContext context, required Product product}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: product)));
  }
}