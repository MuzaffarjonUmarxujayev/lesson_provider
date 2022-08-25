import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("My App"),),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:  const EdgeInsets.all(20),
              color: Colors.green[200],
              child:  ElevatedButton(
                child: const Text('Do something'),
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(35),
              color: Colors.blue[200],
              child: const Text('Show something'),
            ),
          ],
        ),
      ),
    );
  }
}
