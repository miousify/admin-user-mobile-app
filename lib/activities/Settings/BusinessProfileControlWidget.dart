import "package:flutter/material.dart";

import "../../widgets/AppWidgets.dart";

class BusinessProfileControlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppPrimaryScaffold(
      title: "Business profile",
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                BeatifulContentPanel(
                  margin: EdgeInsets.all(16),
                  height: 150,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(0, 50, 0, .9),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "LOGO",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .apply(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                AppPlainInputWidget(
                  label: "Display name",
                ),
                AppPlainInputWidget(
                  label: "Title",
                ),
                AppPlainInputWidget(
                  label: "Brief business description",
                  helperText: "This would be displayed on your site",
                ),
                AppPlainInputWidget(
                  label: "Status",
                ),
                AppPlainInputWidget(
                  label: "Status",
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
