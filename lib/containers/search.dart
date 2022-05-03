import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Page',
      home: Scaffold(
        body: const Center(
          child: Text('This is search page'),
        ),
      ),
    );
  }
}
