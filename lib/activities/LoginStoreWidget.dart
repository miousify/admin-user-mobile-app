import 'package:flutter/material.dart';

import "../data/AppStorage.dart";
import "../data/restActions.dart";

class LoginStore extends StatefulWidget {
  final Function onCreateStore;
  final Function onLoggedin;
  LoginStore({this.onCreateStore, this.onLoggedin});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginStoreState(
        onCreateStore: this.onCreateStore, onLoggedin: this.onLoggedin);
  }
}

class _LoginStoreState extends State<LoginStore> {
  final Function onCreateStore;

  final Function onLoggedin;

  String store_id;
  String password;
  bool sentRequest = false;

  String response;
  _LoginStoreState({this.onCreateStore, this.onLoggedin});

  void login() async {
    //successfull login
    //store auth details
    Map data = {"store_id": store_id, "password": password};
    setState(() {
      sentRequest = true;
    });
    Map res = await StoreRestAction().loginStore(data);
    setState(() {
      sentRequest = false;
    });
    print(res);
    if (res['token'] == false) {
      // failed
      print("failed login");
      return;
    }

    await AppStorage().storeAuth(res);

    this.onLoggedin();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.local_mall,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Login ")
                        ],
                      ),
                      SizedBox(height: 12),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(labelText: "Store id"),
                        onChanged: (String value) {
                          this.setState(() {
                            store_id = value;
                          });
                        },
                      ),
                      SizedBox(height: 24),
                      TextField(
                        decoration: InputDecoration(labelText: "Password"),
                        onChanged: (String value) {
                          this.setState(() {
                            password = value;
                          });
                        },
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                            color: Color.fromRGBO(0, 50, 0, .9),
                            onPressed: () {
                              this.login();
                            },
                            child: Text(
                              "LOGIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .apply(color: Colors.white),
                            ),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: RaisedButton(
                            color: Color.fromRGBO(0, 50, 0, .9),
                            onPressed: () {
                              this.onCreateStore();
                            },
                            child: Text(
                              "CREATE STORE",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .apply(color: Colors.white),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Text(
                            "Forgot your password, you would be able to recover that, please contact our supports team at the moment",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: sentRequest == true ? 16 : 0,
            ),
            if (sentRequest == true)
              Align(
                child: CircularProgressIndicator(),
              )
          ],
        ));
  }
}
