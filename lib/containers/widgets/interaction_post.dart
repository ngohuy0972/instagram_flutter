import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/containers/open_camera_screen.dart';

class InteractionPost extends StatelessWidget {
  const InteractionPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      IconButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OpenCameraScreen()))
        },
        icon: const Icon(
          EvaIcons.heartOutline,
          size: 27.5,
        ),
      ),
      IconButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OpenCameraScreen()))
        },
        icon: const Icon(
          EvaIcons.messageCircleOutline,
          size: 24.5,
        ),
      ),
      IconButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OpenCameraScreen()))
        },
        icon: const Icon(
          EvaIcons.paperPlaneOutline,
          size: 26.0,
        ),
      )
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
