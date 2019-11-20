import "package:flutter/material.dart";

class AppPrimaryScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final List<Widget> actions;

  AppPrimaryScaffold({this.body, this.title, this.actions});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(0, 50, 0, .9)),
        textTheme:
            TextTheme(title: TextStyle(color: Color.fromRGBO(0, 50, 0, .9))),
        title: Text(this.title),
        actions: this.actions,
        backgroundColor: Colors.white,
      ),
      body: this.body,
    );
  }
}
