import "package:flutter/material.dart";

import "./CreateStoreWidget.dart";
import "./LoginStoreWidget.dart";

class LoginWidget extends StatefulWidget {
  final Function onLoggedin;
  LoginWidget({this.onLoggedin});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginWidgetState(onLoggedin: this.onLoggedin);
  }
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _doCreateStore = false;
  final Function onLoggedin;
  _LoginWidgetState({this.onLoggedin}) : super();
  void _createStore() {
    setState(() {
      _doCreateStore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // onLoggedin, used to notify main widget when the user have successfully logged in.
    // onCreates store used to change to the create store widget.
    Widget loginView =
        LoginStore(onCreateStore: _createStore, onLoggedin: this.onLoggedin);
    Widget createStoreView = CreateStoreWidget();

    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 24,
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
                firstChild: loginView,
                secondChild: createStoreView,
                crossFadeState: _doCreateStore == true
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 500))
          ],
        ),
      ],
    ));
  }
}
