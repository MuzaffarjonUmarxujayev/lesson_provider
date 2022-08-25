import 'package:flutter/material.dart';
import 'package:lesson_provider/shop-app/models/category_model.dart';
import 'package:lesson_provider/shop-app/models/product_model.dart';
import 'package:lesson_provider/shop-app/pages/detail/datail_page.dart';
import 'package:lesson_provider/shop-app/services/mock_data.dart';
import '../order/order_page.dart';
import '../products/products_page.dart';

class HomeProvider extends ChangeNotifier {
  int orderNumber = 0;
  List<Category> categories = [];

  HomeProvider() {
    getAllCategories();
  }

  void onTapBasket({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
  }

  void getAllCategories() {
    categories = categoriesMock.map((category) => Category.fromJson(category)).toList();
    for(int i = 0; i < categories.length; i++) {
      categories[i].products = productsMock
          .where((product) => product["categoryId"] == categories[i].id)
          .map((product) => Product.fromJson(product)).toList();
    }
  }

  int getGridSize(Category category) {
    if(category.products.length >= 4) {
      return 4;
    } else {
      return category.products.length;
    }
  }

  void openDetailPage({required BuildContext context, required Product product}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: product)));
  }

  void openProductsPage({required BuildContext context, required String id}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(categoryId: id)));
  }
}