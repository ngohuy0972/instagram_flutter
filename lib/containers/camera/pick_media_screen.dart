import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/navigation_widget/header_nav.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({Key? key}) : super(key: key);

  @override
  _PickImageScreenState createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HeaderNavigation(),
        body: Container(
            child: imageFile == null
                ? Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          color: Colors.black,
                          onPressed: () {
                            _getFromGallery();
                          },
                          icon: const Icon(
                            EvaIcons.imageOutline,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        IconButton(
                          color: Colors.black,
                          onPressed: () {
                            _getFromCamera();
                          },
                          icon: const Icon(
                            EvaIcons.cameraOutline,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Image.file(
                      imageFile!,
                      fit: BoxFit.cover,
                    ),
                  )));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
