import 'package:flutter/material.dart';
import 'package:lesson_provider/counters%20app/view/home_page.dart';
import 'package:lesson_provider/counters%20app/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterTwoView extends StatelessWidget {
  const CounterTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterModel = Provider.of<CounterViewModel>(context, listen: false);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: const Text("+1", style: TextStyle(color: Colors.greenAccent, fontSize: 25),),
            onPressed: () => counterModel.twoIncrement(),
          ),

          Selector<CounterViewModel, int>(
            selector: (context, model) => model.counterModel.counterTwo,
            shouldRebuild: (previous, next) {
              debugPrint("previous: $previous, next: $next");
              return (previous != next) && next >= 0;
            },
            builder: (context, counterTwo, child) {
              debugPrint("Selector: CounterTwoView rebuild");
              return Text("two: $counterTwo", style: const TextStyle(fontSize: 30),);
            },
          ),

          ElevatedButton(
            child: const Text("-1", style: TextStyle(color: Colors.greenAccent, fontSize: 25),),
            onPressed: () => counterModel.twoDecrement(),
          ),
        ],
      ),
    );
  }
}
