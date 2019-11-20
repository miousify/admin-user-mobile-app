import "package:flutter/material.dart";

import "../widgets/AppWidgets.dart";
import "Settings/ContactWidget.dart";
import "Settings/Location.dart";
import "Settings/index.dart";

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

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Settings page",
          style: Theme.of(context).textTheme.subhead,
        ),
        iconTheme: IconThemeData(),
        textTheme: TextTheme(title: TextStyle()),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(0, 50, 0, .9),
            child: BeatifulContentPanel(
              backgroundColor: Colors.white,
              margin: EdgeInsets.all(14),
              paddin: EdgeInsets.all(14),
              child: SwitchListTile(
                activeColor: Color.fromRGBO(0, 50, 0, .9),
                activeTrackColor: Colors.grey,
                value: true,
                onChanged: (value) {},
                selected: true,
                title: Text("Enable store",
                    style: Theme.of(context).textTheme.subtitle),
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
          Column(
            children: <Widget>[
              SettingsLinkWidget(
                title: "Account",
                trailing: Icons.account_circle,
                onClick: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return AccountControlWidget();
                  }));
                },
              ),
              Divider(
                endIndent: 0,
              ),
              SettingsLinkWidget(
                title: "Business Profile",
                trailing: Icons.info,
                onClick: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return BusinessProfileControlWidget();
                  }));
                },
              ),
              SettingsLinkWidget(
                title: "Location",
                trailing: Icons.my_location,
                onClick: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return LocationControlWidget();
                  }));
                },
              ),
              SettingsLinkWidget(
                title: "Contact",
                trailing: Icons.perm_contact_calendar,
                onClick: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ContactControlWidget();
                  }));
                },
              ),
              SettingsLinkWidget(
                title: "Business configuration",
                trailing: Icons.business_center,
              ),
              Divider(),
              SettingsLinkWidget(
                title: "Site settings",
                trailing: Icons.web,
              ),
              Divider(),
              SettingsLinkWidget(
                title: "Push Notifications",
                trailing: Icons.notifications,
              ),
              SettingsLinkWidget(
                title: "Configuration",
                trailing: Icons.settings,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
