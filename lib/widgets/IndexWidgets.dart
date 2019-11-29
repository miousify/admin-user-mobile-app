import "package:flutter/material.dart";

import "./AppWidgets.dart";
import "./Containers.dart";
import 'independent/TransactionInsight.dart';

int generalPadding = 24;

class InfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Transactions(),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ],
        ),
      ),
      aspectRatio: 1 / .65,
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
            caption: Column(
              children: <Widget>[
                Text(
                  "Get started!!!",
                  style: Theme.of(context).textTheme.subhead.apply(),
                ),
                Text(
                  "You don't have any products added yet",
                  style: Theme.of(context).textTheme.caption.apply(),
                )
              ],
            ),
            infor: Text("0"),
            action: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppPrimaryButton(
                    label: "Create product",
                    onClick: () {
                      Navigator.pushNamed(context, "/create-product",
                          arguments: {"isNew": true});
                    })
              ],
            )),
        SizedBox(
          height: 12,
        ),
        _BucketInfo(
            caption: Column(
              children: <Widget>[
                Text(
                  "Get started!!!",
                  style: Theme.of(context).textTheme.subhead.apply(),
                ),
                Text(
                  "You don't have any categories for classification",
                  style: Theme.of(context).textTheme.caption.apply(),
                )
              ],
            ),
            cardTitle: "Categories",
            action: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppPlainButton(
                    label: "Create category",
                    onClick: () {
                      Navigator.pushNamed(context, "/create-category",
                          arguments: {"isNew": true});
                    })
              ],
            )),
      ],
    );
  }
}

class _BucketInfo extends StatelessWidget {
  final String cardTitle;
  final List<Widget> tags;
  final Widget action;
  final Widget caption;
  final Widget infor;
  _BucketInfo(
      {this.caption, this.action, this.cardTitle, this.infor, this.tags});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  cardTitle,
                  style: Theme.of(context).textTheme.subhead.apply(),
                ),
                this.tags == null
                    ? Text("")
                    : Row(
                        children: this.tags,
                        crossAxisAlignment: CrossAxisAlignment.end,
                      )
              ],
            ),
          ),
          Divider(
            endIndent: 0,
            indent: 0,
            thickness: 0,
            height: 0,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                caption,
                SizedBox(
                  height: 16,
                ),
                action
              ],
            ),
          )
        ],
      ),
    );
  }
}
