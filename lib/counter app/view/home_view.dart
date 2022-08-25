import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/counter_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterViewModel>(context, listen: false);
    debugPrint("build HomeView");

    return Scaffold(
      body:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text(
            "+1",
          style: TextStyle(color: Colors.greenAccent, fontSize: 25),
        ),
          onPressed: () => counter.increment(),
            ),
            Consumer<CounterViewModel>(builder: (context, model, child){
              debugPrint("build Consumer");
              return Text(
                "${model.counter}",
                style: const TextStyle(fontSize: 30),
              );
            },),
            ElevatedButton(
              child: const Text(
                "-1",
                style: TextStyle(color: Colors.redAccent, fontSize: 25),
              ),
              onPressed: () => counter.decrement(),
            ),
          ],
        ),
      ),
    );
  }
}
