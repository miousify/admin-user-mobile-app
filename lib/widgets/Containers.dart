import 'package:flutter/material.dart';

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

class BeatifulContentPanel extends StatelessWidget {
  final int height;
  final Widget child;
  final EdgeInsets paddin;
  final EdgeInsets margin;
  final String imageAsset;
  final Color backgroundColor;
  final bool userBackgroundImage;
  BeatifulContentPanel(
      {this.height,
      this.backgroundColor,
      this.child,
      this.paddin,
      this.margin,
      this.imageAsset = null,
      this.userBackgroundImage});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: this.child,
      padding: this.paddin,
      margin: this.margin,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(this.userBackgroundImage == true
                  ? "images/product_add.jpg"
                  : ""),
              fit: BoxFit.contain),
          color: this.backgroundColor == null
              ? Color.fromRGBO(200, 200, 200, .4)
              : this.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class BeatifulCardPanel extends StatelessWidget {
  final int height;
  final Widget child;
  final EdgeInsets paddin;
  final EdgeInsets margin;
  final String imageAsset;
  final Color backgroundColor;
  final bool userBackgroundImage;
  BeatifulCardPanel(
      {this.height,
      this.backgroundColor,
      this.child,
      this.paddin,
      this.margin,
      this.imageAsset = null,
      this.userBackgroundImage});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: this.backgroundColor == null ? Colors.white : this.backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        child: this.child,
        padding: this.paddin,
        margin: this.margin,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(this.userBackgroundImage == true
                  ? "images/product_add.jpg"
                  : ""),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class AppSpacedCard extends StatelessWidget {
  final Widget child;
  AppSpacedCard({this.child});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Color.fromRGBO(200, 200, 200, .4),
          padding: EdgeInsets.all(16),
          child: this.child,
        ),
      ),
    );
  }
}

class SettingsLinkWidget extends StatelessWidget {
  final Function onClick;
  final String title;
  final String description;
  final IconData trailing;

  SettingsLinkWidget(
      {this.description, this.title, this.onClick, this.trailing});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      onPressed: () {},
      child: Container(
        child: ListTile(
          onTap: () {
            onClick();
          },
          leading: this.trailing == null ? null : Icon(this.trailing),
          title: Text(title),
          subtitle: Text("settings subtitle"),
          // trailing: this.trailing == null ? null : Icon(this.trailing),
        ),
      ),
    );
  }
}

class AppClipRound extends StatelessWidget {
  final Widget child;

  AppClipRound({this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Container(
        child: this.child,
        color: Colors.black,
      ),
    );
  }
}
