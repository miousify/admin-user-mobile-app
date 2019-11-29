import "package:flutter/material.dart";

import "../../widgets/AppWidgets.dart";
import "../../widgets/independent/CardTokenHandlerWidget.dart";

class AccountConfiguration extends StatelessWidget {
  Widget topSpace = SizedBox(
    height: 8,
  );
  Widget leftSpace = SizedBox(
    width: 8,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    topSpace,
                    Text(
                      "Service Plan",
                      style: Theme.of(context).textTheme.subtitle.apply(),
                    ),
                    Text(
                      "Updating you plan would reboot your system, an take new configurations based on the plan selected",
                      style: Theme.of(context).textTheme.caption.apply(),
                    ),
                    topSpace,
                    AppPopupWidget(
                      label: "Select plan",
                      entries: <PopupMenuItem>[
                        PopupMenuItem(
                          height: 60,
                          child: PlanWidget(
                            planLabel: "Basic plan",
                          ),
                        ),
                        PopupMenuItem(
                          height: 60,
                          child: PlanWidget(
                            planLabel: "Basic plan",
                          ),
                        ),
                        PopupMenuItem(
                          height: 60,
                          child: PlanWidget(
                            planLabel: "Basic plan",
                          ),
                        )
                      ],
                    ),
                    topSpace,
                    Text(
                      "Setup payment Card",
                      style: Theme.of(context).textTheme.subtitle.apply(),
                    ),
                    Text(
                      "Payment card must be setup for billing",
                      style: Theme.of(context).textTheme.caption.apply(),
                    ),
                    topSpace,
                    RawMaterialButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CardTokenHandlerWidget();
                            });
                      },
                      child: AppCardButton(label: "Setup card"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(),
                RaisedButton(
                  elevation: 1,
                  textColor: Colors.white,
                  onPressed: () {},
                  padding: EdgeInsets.all(16),
                  child: Text("Start trial"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PlanWidget extends StatelessWidget {
  final String planLabel;
  PlanWidget({this.planLabel});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Icon(
          Icons.local_play,
          color: Colors.black87,
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            this.planLabel,
            style: Theme.of(context).textTheme.button,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Icon(
          Icons.chevron_right,
          color: Colors.black87,
        ),
      ],
    );
  }
}

class AccountBillingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "No billing details available for this store at the moment",
                style: Theme.of(context).textTheme.subtitle,
                textAlign: TextAlign.center,
              ),
              Text(
                "Setup your store properly to get this functionality working",
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        )
      ],
    );
  }
}

class AccountControlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _widgets = <Widget>[AccountConfiguration(), AccountBillingWidget()];

    Tab _createCustomTab(String label, IconData icon) {
      return Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .apply(color: Colors.black87),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              color: Colors.black87,
            )
          ],
        ),
      );
    }

    final _tabs = <Tab>[
      _createCustomTab("Config", Icons.videogame_asset),
      _createCustomTab("Billing", Icons.payment),
    ];
    // TODO: implement build
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Account"),
            bottom: TabBar(tabs: _tabs),
          ),
          body: TabBarView(children: _widgets),
        ));
  }
}
