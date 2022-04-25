import 'package:flutter/material.dart';

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to the flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to the instagram app by flutter'),
        ),
        body: const Center(
          child: Text('Hello guys'),
        ),
      ),
    );
  }
}
