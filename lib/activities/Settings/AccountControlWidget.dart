import "package:flutter/material.dart";

import "../../widgets/AppWidgets.dart";

class AccountControlWidget extends StatelessWidget {
  Widget topSpace = SizedBox(
    height: 8,
  );
  Widget leftSpace = SizedBox(
    width: 8,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppPrimaryScaffold(
      title: "Account",
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: BeatifulContentPanel(
              child: Container(
                height: 100,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              child: BeatifulContentPanel(
                paddin: EdgeInsets.all(16),
                backgroundColor: Color.fromRGBO(0, 50, 0, .1),
                child: ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(),
                          title: Text("Business display name"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Business description"),
                            ],
                          ),
                        ),
                        Divider(),
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
                          label: "Uplate plan",
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
                                  return Container(child: Text("Text"));
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
            ),
          )
        ],
      ),
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
