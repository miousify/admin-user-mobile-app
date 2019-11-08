import "package:flutter/material.dart";

import "Settings/GeneralSettings.dart";

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

    void generalSettings() {
      Navigator.push(context, GeneralSettings());
    }

    Widget settingsLinkWidget({String title}) {
      return RawMaterialButton(
        onPressed: generalSettings,
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12),
          child: ListTile(
            leading: CircleAvatar(),
            title: Text(title),
            subtitle: Text("settings subtitle"),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings page"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            child: Container(
              color: Colors.lightBlue,
              height: 80,
            ),
            padding: EdgeInsets.only(left: 12, right: 12, top: 12),
          ),
          settingsLinkWidget(title: "General"),
          settingsLinkWidget(title: "UI"),
          settingsLinkWidget(title: "Business"),
          Divider(),
          settingsLinkWidget(title: "Account"),
          Divider(),
          settingsLinkWidget(title: "Location"),
          settingsLinkWidget(title: "Contact"),
          settingsLinkWidget(title: "Site"),
          Divider(),
          settingsLinkWidget(title: "Server"),
        ],
      ),
    );
  }
}
