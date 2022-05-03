import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/profile_user.dart';

class ProfilePost extends StatefulWidget {
  @override
  _ProfilePostState createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsProfile = [];

  void getProfileData() {
    List<dynamic> profileList = USER_PROFILE_DATA;
    List<Widget> listItems = [];

    profileList.forEach((profile) {
      profile["post"].forEach((post) {
        listItems.add(
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.zero),
                child: Image.asset(
                  '${post["image"]}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        );
      });
    });
    setState(() {
      itemsProfile = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: GridView.count(
          children: itemsProfile,
          crossAxisCount: 3,
        )),
      ),
    );
  }
}
