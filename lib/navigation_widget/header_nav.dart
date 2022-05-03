import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HeaderNavigation extends StatelessWidget with PreferredSizeWidget {
  const HeaderNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var headerNavigation = <Widget>[
      Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(EvaIcons.arrowBackOutline),
                iconSize: 26.0,
              ),
            ],
          )),
      Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Name Screen',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ],
          )),
      Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
          ))
    ];

    return Material(
      child: SafeArea(
        child: Row(children: headerNavigation),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(40);
}
