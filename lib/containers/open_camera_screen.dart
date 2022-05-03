import 'package:flutter/material.dart';
import 'package:instagram_flutter/navigation_widget/header_nav.dart';

class OpenCameraScreen extends StatelessWidget {
  const OpenCameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeaderNavigation(),
      body: Center(
        child: Text('Open Camera'),
      ),
    );
  }
}
