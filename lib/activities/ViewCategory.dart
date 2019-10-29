import "package:flutter/material.dart";

class CategoryViewRoute extends MaterialPageRoute {
  CategoryViewRoute()
      : super(builder: (BuildContext context) {
          return View();
        });
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Prooduct Page"),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
