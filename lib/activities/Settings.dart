import "package:flutter/material.dart";

class SettingsRoute extends MaterialPageRoute {
  SettingsRoute()
      : super(builder: (BuildContext context) {
          return Settings();
        });
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
