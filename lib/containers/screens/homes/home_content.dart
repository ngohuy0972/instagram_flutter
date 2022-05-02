import 'package:flutter/material.dart';
import 'package:instagram_flutter/containers/screens/homes/post.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0), // Or set whatever you want
        child: SizedBox(
          width: double.infinity,
          child: Post(),
        ));
  }
}
