import "package:flutter/material.dart";

import "../widgets/AppWidgets.dart";
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
          padding: EdgeInsets.only(left: 12, right: 12),
          child: ListTile(
            dense: true,
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
        backgroundColor: Color.fromRGBO(0, 50, 0, .9),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(0, 50, 0, .9),
            child: BeatifulContentPanel(
              margin: EdgeInsets.all(16),
              child: SwitchListTile(
                activeColor: Colors.blue,
                activeTrackColor: Colors.transparent,
                value: true,
                onChanged: (value) {},
                selected: true,
                title: Text(
                  "Enable store",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .apply(color: Colors.white),
                ),
                subtitle: Text(
                  "you must add a card, and a selected plan to successfully enable your store",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .apply(color: Colors.grey),
                ),
              ),
            ),
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
