import 'package:flutter/material.dart';

import "../../widgets/AppWidgets.dart";

class GeneralSettings extends MaterialPageRoute {
  GeneralSettings()
      : super(builder: (BuildContext context) {
          return _WidgetStateful();
        });
}

class _WidgetStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetStatefulState();
  }
}

class _WidgetStatefulState extends State<_WidgetStateful> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppPrimaryScaffold(
      title: "General Settings",
    );
  }
}
