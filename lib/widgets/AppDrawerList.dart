import 'package:flutter/material.dart';

class AppDrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget itemWidget(
        {String route,
        IconData iconData = Icons.add,
        String title = "title",
        String caption = "caption"}) {
      return RawMaterialButton(
        onPressed: () {},
        splashColor: Colors.lightBlue,
        child: ListTile(
          contentPadding:
              EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
          dense: true,
          leading: Icon(Icons.title),
          title: Text("Link name"),
          subtitle: Text("Subtitle"),
        ),
      );
    }

    // TODO: implement build
    return Column(children: [
      Container(
        height: 80,
        color: Colors.blue,
      ),
      Expanded(
        child: ListView(
          itemExtent: 60,
          children: <Widget>[itemWidget(), itemWidget()],
        ),
      ),
      Container(
        height: 80,
        color: Colors.blue,
      )
    ]);
  }
}
