import 'package:flutter/material.dart';
import 'package:instagram_flutter/containers/screens/homes/home_content.dart';
import 'package:instagram_flutter/navigation_widget/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      body: HomeContent(),
    );
  }
}
