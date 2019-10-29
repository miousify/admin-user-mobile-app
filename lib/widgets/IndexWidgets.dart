import "package:flutter/material.dart";

class InfoBox extends StatelessWidget {
  final Function loadTransactions;
  final Function loadCustomers;
  InfoBox({this.loadCustomers, this.loadTransactions});

  @override
  Widget build(BuildContext context) {
    Widget actionButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            onPressed: loadTransactions,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Transactions",
                  style: Theme.of(context).textTheme.button,
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
            child: FlatButton(
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          onPressed: loadCustomers,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Customers",
                style: Theme.of(context).textTheme.button,
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ))
      ],
    );

    // TODO: implement build
    return AspectRatio(
      child: Container(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Text(""),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 16),
                      child: actionButton,
                      height: 100,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      aspectRatio: 1 / .6,
    );
  }
}

class BottomNavigation {}
