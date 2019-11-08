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
        title: Text(this.title),
        actions: this.actions,
      ),
      body: this.body,
    );
  }
}
