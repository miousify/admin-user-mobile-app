import "package:flutter/material.dart";

import "./ContactWidget.dart";
import "./Location.dart";
import "./index.dart";
import "../../widgets/AppWidgets.dart";

class AdminRoute extends MaterialPageRoute {
  AdminRoute()
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

    return AppPrimaryScaffold(
      title: "Admin",
      body: ListView(
        children: <Widget>[
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
