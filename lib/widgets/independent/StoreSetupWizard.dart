import 'package:flutter/material.dart';

import '../AppWidgets.dart';

class StoreSetupWizard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class _StoreSetupState extends State<StoreSetupWizard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 1 / .7,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Get Started",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .apply(color: Colors.white),
            ),
            Text(
              "Descriptions on getting started",
              style:
                  Theme.of(context).textTheme.body1.apply(color: Colors.white),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                AppPlainButton(
                  label: "Skip Setup",
                  onClick: () {},
                ),
                AppPrimaryButton(
                  label: "Complete setup",
                  onClick: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
