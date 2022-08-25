import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<MyModel>(
                    builder: (context, myModel, child) {
                      return ElevatedButton(
                        child: const Text('Do something'),
                        onPressed: (){
                          myModel.doSomething();
                        },
                      );
                    }
                ),
              ),

              Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.blue[200],
                  child: Consumer<MyModel>(
                    builder: (context, myModel, child) {
                      return Text(myModel.someValue);
                    },
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class MyModel {
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    debugPrint(someValue);
  }
}
