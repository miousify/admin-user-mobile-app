import 'package:flutter/material.dart';

import './CustomWidgets.dart';

class AppRoundedContainer extends StatelessWidget {
  final Widget child;

  AppRoundedContainer({this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
      child: Container(
        child: this.child,
      ),
    );
  }
}

class BeatifulHomeActionButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final String caption;
  final String routePath;
  final bool isIconLeft;

  BeatifulHomeActionButton(
      {this.onTap,
      this.title,
      this.caption,
      this.routePath,
      this.isIconLeft = true});

  @override
  Widget build(BuildContext context) {
    Widget iconBox = SizedBox(
      height: 80,
      width: 80,
      child: Container(
        child: Card(
          color: Colors.blue,
          elevation: 2,
        ),
      ),
    );
    // TODO: implement build
    return AppFlatActionCard(
        Container(
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (this.isIconLeft == true) iconBox,
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: this.isIconLeft
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          this.title,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        Text(
                          this.caption,
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  if (this.isIconLeft == false) iconBox,
                ],
              ),
            ],
          ),
        ),
        onTap: this.onTap,
        padding: EdgeInsets.all(0));
  }
}
