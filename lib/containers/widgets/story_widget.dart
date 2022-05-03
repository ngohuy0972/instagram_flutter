import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/story.dart';

class storyWidget extends StatefulWidget {
  @override
  _storyWidgetState createState() => _storyWidgetState();
}

class _storyWidgetState extends State<storyWidget> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsStory = [];

  void getStorysData() {
    List<dynamic> storyList = STORY_DATA;
    List<Widget> listItems = [];
    var firstStory = storyList.first;
    storyList.forEach((story) {
      debugPrint('First Story Data: ${storyList[0]}');
      listItems.add(Container(
          margin: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
          child: Card(
            elevation: 0,
            child: InkWell(
              onTap: () => print("click on story"),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color.fromARGB(0, 238, 141, 247),
                    child: CircleAvatar(
                      radius: 38.0,
                      backgroundImage: AssetImage('${story["image"]}'),
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )));
    });
    setState(() {
      itemsStory = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getStorysData();
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint('Height: $size');
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 10.0),
          height: 80,
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => {print('Add new story')},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            CircleAvatar(
                              radius: 27.0,
                              backgroundColor: Colors.blue,
                              child: CircleAvatar(
                                radius: 25.0,
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 10.0,
                                      child: Icon(
                                        EvaIcons.plus,
                                        size: 15.0,
                                        color: Colors.white,
                                      ),
                                    )),
                                backgroundColor: Colors.black,
                                backgroundImage: AssetImage('me.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ))),
              Expanded(
                  flex: 8,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      itemCount: itemsStory.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: itemsStory[index],
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
