import 'package:flutter/material.dart';
import 'package:lesson_provider/counters%20app/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterOneView extends StatelessWidget {
  const CounterOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterModel = context.read<CounterViewModel>();

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: const Text("+1", style: TextStyle(color: Colors.greenAccent, fontSize: 25),),
            onPressed: () => counterModel.oneIncrement(),
          ),

          Selector<CounterViewModel, int>(
            selector: (context, model) => model.counterModel.counterOne,
            builder: (context, counterOne, child) {
              debugPrint("Selector: CounterOneView rebuild");
              return Text("one: $counterOne", style: const TextStyle(fontSize: 30),);
            },
          ),

          ElevatedButton(
            child: const Text("-1", style: TextStyle(color: Colors.greenAccent, fontSize: 25),),
            onPressed: () => counterModel.oneDecrement(),
          ),
        ],
      ),
    );
  }
}
