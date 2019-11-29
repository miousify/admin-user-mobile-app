import "package:flutter/material.dart";

import "./AppWidgets.dart";
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

class IndexBucketsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemExtent: 270,
      children: <Widget>[
        _BucketInfo(
          cardTitle: "Get started",
          action: AppPrimaryButton(
            label: "Create Product",
            onClick: () {},
          ),
        ),
        _BucketInfo(
          cardTitle: "Get started",
          action: AppPlainButton(
            label: "Create category",
          ),
        ),
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
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: BeatifulCardPanel(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: BeatifulCardPanel(
                  elevation: 0,
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, left: 14, right: 14),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.cardTitle,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    "Add more productucts to your store",
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              child: this.action,
            )
          ],
        )),
      ),
    );
  }
}
