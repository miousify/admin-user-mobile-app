import "package:flutter/material.dart";

import "./Account/Account.dart";
import "../widgets/AppWidgets.dart";

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
      //Navigator.push(context, GeneralSettings());
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
              child: ListTile(
                onTap: () {
                  Navigator.push(context, AccountRoute());
                },
                title: Text("Administrative area",
                    style: Theme.of(context).textTheme.subtitle),
                subtitle: Text(
                  "Business account page",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .apply(color: Colors.grey),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(
                height: 0,
              ),
              SettingsLinkWidget(
                title: "Security",
                trailing: Icons.security,
                onClick: () {},
              ),
              SettingsLinkWidget(
                title: "Notifications",
                trailing: Icons.notifications,
              ),
              Divider(
                height: 0,
              ),
              Divider(
                height: 0,
              ),
              SettingsLinkWidget(
                title: "Terms of service",
                trailing: Icons.insert_comment,
              ),
              SettingsLinkWidget(
                title: "About",
                trailing: Icons.info,
              ),
              SettingsLinkWidget(
                title: "Support",
                trailing: Icons.supervisor_account,
              ),
              Container(
                child: BeatifulContentPanel(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Container(
                    height: 100,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: AppPrimaryButton(
                  onClick: () {},
                  label: "Logout",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
