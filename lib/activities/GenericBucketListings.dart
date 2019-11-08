import "package:flutter/material.dart";

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget customerItem() {
      return Container(
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(8),
              child: ListTile(
                  title: Text("Customer Name"),
                  subtitle: Row(
                    children: <Widget>[
                      Text("successful orders: "),
                      SizedBox(
                        width: 8,
                      ),
                      Text("pending order")
                    ],
                  ),
                  leading: CircleAvatar()),
            )),
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Customers")),
      body: ListView(
        children: <Widget>[
          customerItem(),
          customerItem(),
          customerItem(),
          customerItem()
        ],
      ),
    );
  }
}
