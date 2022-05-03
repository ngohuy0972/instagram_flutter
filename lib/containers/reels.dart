import 'package:flutter/material.dart';

class ReelPage extends StatelessWidget {
  const ReelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reels Page',
      home: Scaffold(
        body: const Center(
          child: Text('This is reels page'),
        ),
      ),
    );
  }
}
