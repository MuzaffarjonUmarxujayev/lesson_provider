import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/counter_view_model.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context) => CounterViewModel(),
      child: const HomeView(),
    );
  }
}
