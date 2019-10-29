import "package:flutter/material.dart";

class TransactionsViewRoute extends MaterialPageRoute {
  TransactionsViewRoute()
      : super(builder: (BuildContext context) {
          return View();
        });
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget transactionItem() {
      return Container(
        margin: EdgeInsets.only(top: 16, left: 12, right: 12),
        child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(8),
              child: ListTile(
                  title: Text("Transaction id"),
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
      appBar: AppBar(title: Text("Transactions")),
      body: ListView(
        children: <Widget>[
          transactionItem(),
          transactionItem(),
          transactionItem(),
          transactionItem(),
          transactionItem(),
          transactionItem(),
        ],
      ),
    );
  }
}
