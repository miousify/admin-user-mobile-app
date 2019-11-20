import "package:flutter/material.dart";

import "./AppWidgets.dart";
import "./Containers.dart";
import 'independent/TransactionInsight.dart';

int generalPadding = 24;

class InfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget createContextButton(
        String label, String path, bool active, bool isLeft) {
      Color color =
          active == true ? Color.fromRGBO(20, 100, 0, .9) : Colors.black87;
      return FlatButton(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        onPressed: () {
          Navigator.pushNamed(context, path);
        },
        color:
            active == true ? Colors.white : Color.fromRGBO(200, 200, 200, .9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (isLeft == true)
              Icon(
                Icons.chevron_left,
                color: color,
              ),
            Text(
              label,
              style: Theme.of(context).textTheme.button.apply(color: color),
            ),
            if (isLeft == false)
              Icon(
                Icons.chevron_right,
                color: color,
              ),
          ],
        ),
      );
    }

    Widget actionButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child:
              createContextButton("Transactions", "/transactions", true, true),
        ),
        Expanded(
            child: createContextButton("Customers", "/customers", false, false))
      ],
    );

    // TODO: implement build
    return Column(
      children: <Widget>[
        AspectRatio(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Stack(
              children: <Widget>[
                Padding(
                  child: BeatifulCardPanel(
                    userBackgroundImage: false,
                    child: ClipRRect(
                      child: Transactions(),
                      borderRadius: BorderRadius.all(Radius.elliptical(14, 14)),
                    ),
                  ),
                  padding: EdgeInsets.only(),
                ),
              ],
            ),
          ),
          aspectRatio: 1 / .7,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
          child: Card(
            color: Colors.transparent,
            elevation: 2,
            child: Container(child: actionButton),
          ),
        )
      ],
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
            tags: <Widget>[
              Text("0: likes"),
              SizedBox(
                width: 4,
              ),
              Text("20 : available"),
              SizedBox(
                width: 4,
              ),
              Text("20 : purchased")
            ],
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
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BeatifulCardPanel(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      left: 16, bottom: 16, top: 16, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        cardTitle,
                        style: Theme.of(context).textTheme.subtitle.apply(),
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
          ),
        ),
      ),
    );
  }
}
