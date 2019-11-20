import "package:flutter/material.dart";

import "../../widgets/AppWidgets.dart";

class LocationControlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppPrimaryScaffold(
      title: "Account",
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                AppPlainInputWidget(
                  label: "Nationality",
                ),
                AppPlainInputWidget(
                  label: "State",
                ),
                AppPlainInputWidget(
                  label: "City",
                  helperText: "This would be displayed on your site",
                ),
                AppPlainInputWidget(
                  label: "Zip Code",
                ),
                AppPlainInputWidget(
                  label: "Location on Google maps",
                ),
                AppPlainInputWidget(
                  label: "Blog URL",
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
