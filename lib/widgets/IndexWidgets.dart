import "package:flutter/material.dart";

import "./Containers.dart";

int generalPadding = 24;

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
            onPressed: () {
              Navigator.pushNamed(context, "/transactions",
                  arguments: {"isNew": true});
            },
            color: Colors.transparent,
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
        Expanded(
            child: FlatButton(
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          onPressed: () {
            Navigator.pushNamed(context, "/customers",
                arguments: {"isNew": true});
          },
          color: Colors.transparent,
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
        margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Stack(
          children: <Widget>[
            BeatifulContentPanel(
              userBackgroundImage: true,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: Card(
                    color: Colors.green,
                    elevation: 5,
                    child: Container(child: actionButton),
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

class BriefProductList extends StatelessWidget {
  Widget productsPageBtn = RawMaterialButton(
    onPressed: () {},
    elevation: 10,
    padding: EdgeInsets.all(12),
    shape: CircleBorder(),
    child: Icon(
      Icons.arrow_forward_ios,
      size: 14,
      color: Colors.green,
    ),
    fillColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    Widget ii = Container(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Card(
          color: Colors.blue,
          child: Image.network(
            '',
          ),
        ),
      ),
    );
    // TODO: implement build
    return Container(
      constraints: BoxConstraints.tightFor(height: 180),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BeatifulContentPanel(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            paddin: EdgeInsets.all(12),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 12,
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  itemExtent: 100,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (int i = 0; i <= 10; i++)
                      Align(
                        alignment: Alignment.center,
                        child: ii,
                      ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[SizedBox(), productsPageBtn],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        ],
      ),
    );
  }
}

class IndexBucketsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _BucketInfo(
            cardTitle: "Products",
            caption: Text(
              "You don't have any products added yet",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .apply(color: Colors.white),
            ),
            infor: Text("0"),
            action: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/create-product",
                        arguments: {"isNew": true});
                  },
                  color: Colors.green,
                  child: Text("Create product",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .apply(color: Colors.white)),
                )
              ],
            )),
        _BucketInfo(
            caption: Text(
              "You don't have any category in your store",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .apply(color: Colors.white),
            ),
            cardTitle: "Categories",
            action: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/create-category",
                        arguments: {"isNew": true});
                  },
                  color: Colors.green,
                  child: Text(
                    "Create category",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .apply(color: Colors.white),
                  ),
                )
              ],
            )),
      ],
    );
  }
}

class _BucketInfo extends StatelessWidget {
  final String cardTitle;

  final Widget action;

  final Widget caption;

  final Widget infor;

  _BucketInfo({this.caption, this.action, this.cardTitle, this.infor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BeatifulContentPanel(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 12, top: 16),
                      child: Text(
                        cardTitle,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .apply(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar()
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      caption,
                      SizedBox(
                        height: 8,
                      ),
                      action
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
