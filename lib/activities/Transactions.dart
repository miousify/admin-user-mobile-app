import "package:flutter/material.dart";

import "./GenericBucketListings.dart";
import "../data/models/TransactionModel.dart";
import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

class TransactionsViewRoute extends MaterialPageRoute {
  TransactionsViewRoute()
      : super(builder: (BuildContext context) {
          return Transactions();
        });
}

class Transactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TransactionsState();
  }
}

// Controlls the state of the transactions page. and loads all items in the transactions bucket/**/
class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppPrimaryScaffold(
      title: "Transactions",
      body: TransactionsList(
        filter: "",
      ),
    );
  }
}

class TransactionsList extends GenericList {
  final String filter;
  TransactionsList({this.filter})
      : super(action: new TransactionActions(), filter: filter);

  @override
  Widget bucketItemsBuilder(List items) {
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

    Iterable<Widget> itemsWidgetList =
        TransactionListModel(items).items.map((TransactionModel transaction) {
      return transactionItem();
    });

    List<Widget> itemsList = itemsWidgetList.toList();

    // TODO: implement bucketItemsBuilder
    return Container(
      child: items.length == 0
          ? Center(
              child: Text("nothing to show"),
            )
          : Column(children: itemsList),
    );
  }
}
