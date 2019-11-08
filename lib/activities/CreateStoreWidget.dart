import "package:flutter/material.dart";

class CreateStoreWidget extends StatelessWidget {
  Function onCreate;

  CreateStoreWidget({this.onCreate});

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
                            Icons.new_releases,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Create new store")
                        ],
                      ),
                      SizedBox(height: 12),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  ".miousify.com",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Icon(
                                  Icons.link,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            labelText: "Store id",
                            helperText:
                                "Basically your unique store name, we use this id to provide a unique domain name to your site.  e.g mystore"),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            focusColor: Color.fromRGBO(0, 50, 0, .9)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Phone",
                            focusColor: Color.fromRGBO(0, 50, 0, .9)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            focusColor: Color.fromRGBO(0, 50, 0, .9)),
                      ),
                      SizedBox(height: 24),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Create store"),
                        textColor: Colors.white,
                        color: Color.fromRGBO(0, 50, 0, .9),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Text(
                            "Ensure to set up your store in the settings page.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
