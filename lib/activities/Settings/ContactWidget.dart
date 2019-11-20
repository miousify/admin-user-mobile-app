import "package:flutter/material.dart";

import "../../widgets/AppWidgets.dart";

class ContactControlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppPrimaryScaffold(
      title: "Contact",
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Why we need your contact",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .apply(color: Colors.white),
                      )
                    ],
                  ),
                  color: Colors.grey,
                  padding: EdgeInsets.all(14),
                ),
                SizedBox(
                  height: 16,
                ),
                AppPlainInputWidget(
                  label: "Primary phone no.",
                ),
                AppPlainInputWidget(
                  label: "Email",
                ),
                AppPlainInputWidget(
                  label: "Facebook",
                  helperText: "This would be displayed on your site",
                ),
                AppPlainInputWidget(
                  label: "Instagram",
                ),
                AppPlainInputWidget(
                  label: "Whatsapp line",
                ),
                AppPlainInputWidget(
                  label: "Twitter",
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              padding: EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Save"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
