import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Page',
      home: Scaffold(
        body: const Center(
          child: Text('This is notification page'),
        ),
      ),
    );
  }
}
