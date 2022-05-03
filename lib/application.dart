import 'package:flutter/material.dart';
import 'package:instagram_flutter/containers/authentications/login.dart';
import 'package:instagram_flutter/containers/authentications/register.dart';
import 'package:instagram_flutter/navigation_widget/bottom_nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: LoginScreen(),
    );
  }
}
