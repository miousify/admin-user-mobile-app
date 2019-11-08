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
        backgroundColor: Color.fromRGBO(0, 30, 0, .9),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("images/product_add.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(),
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
