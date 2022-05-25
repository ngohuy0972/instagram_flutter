import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/containers/screens/profiles/profile_post.dart';
import 'package:instagram_flutter/data/profile_user.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  Future pickImageGallery() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  List<Widget> itemsProfile = [];

  @override
  Widget build(BuildContext context) {
    var profileCard = [
      Positioned(
          child: Container(
        height: 170,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      )),
      Positioned(
          top: 10,
          right: 10,
          child: TextButton(
            onPressed: () => pickImageGallery(),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 12.0,
              child: Icon(
                Icons.camera_alt,
                size: 15.0,
                color: Colors.black,
              ),
            ),
          )),
      Container(
          margin: const EdgeInsets.only(
              top: 80, bottom: 10, left: 20.0, right: 20.0),
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(EvaIcons.logOut),
                        onPressed: () => {Navigator.pop(context)},
                      ),
                    ],
                  )),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Hi Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '10 ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Follower'),
                              ],
                            ))),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '100 ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Following'),
                              ],
                            ))),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '10 ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Posts'),
                              ],
                            ))),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
      Align(
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Positioned(
              top: 40,
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15.0,
                        child: Container(
                          margin: EdgeInsets.only(),
                          child: TextButton(
                            onPressed: () => pickImageGallery(),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ),
                  radius: 42.0,
                  backgroundImage: const AssetImage('me.jpg'),
                ),
              ),
            ),
          ])),
      const SizedBox(
        height: 15,
      ),
    ];

    return Material(
      child: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 4,
                      child: Stack(
                        children: profileCard,
                      )),
                ],
              )),
          Expanded(
            flex: 7,
            child: ProfilePost(),
          )
        ],
      )),
    );
  }
}
