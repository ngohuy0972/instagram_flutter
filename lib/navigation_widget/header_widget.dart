import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/containers/open_camera_screen.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  Future pickImageGallery() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future pickImageCamera() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    var headerLeft = <Widget>[
      Expanded(
        flex: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'instagram_logo.png',
              height: 150,
              width: 120,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
      Expanded(
          flex: 5,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
                onPressed: () => pickImageGallery(),
                icon: const Icon(EvaIcons.plusCircleOutline)),
            IconButton(
                onPressed: () => pickImageCamera(),
                icon: const Icon(EvaIcons.messageCircleOutline)),
          ])),
    ];

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: 8.0,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center, children: headerLeft),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
