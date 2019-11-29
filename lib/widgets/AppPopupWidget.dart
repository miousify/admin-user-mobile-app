import "package:flutter/material.dart";

class AppPopupWidget extends StatelessWidget {
  final String label;
  final IconData leadingIcon;
  final Widget trailing;
  final Function onSelect;
  final List<PopupMenuItem> entries;
  AppPopupWidget(
      {this.label,
      this.trailing,
      this.leadingIcon,
      this.onSelect,
      this.entries});

  Widget topSpace = SizedBox(
    height: 8,
  );
  Widget leftSpace = SizedBox(
    width: 8,
  );

  @override
  Widget build(BuildContext context) {
    Widget button = Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.description,
                  color: Color.fromRGBO(0, 50, 0, .9),
                ),
                leftSpace,
                Text(this.label, style: Theme.of(context).textTheme.button)
              ],
            ),
            Icon(
              Icons.info,
              color: Color.fromRGBO(0, 50, 0, .9),
            )
          ],
        ),
      ),
    );

    // TODO: implement build
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return this.entries;
      },
      child: button,
    );
  }
}
