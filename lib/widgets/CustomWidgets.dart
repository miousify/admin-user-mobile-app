import 'package:flutter/material.dart';

Widget AppRaisedButton(String title, {onPressed: Function, icon: String}) {
  return MaterialButton(
    onPressed: () {},
    shape: StadiumBorder(),
    color: Colors.blue,
    child: Row(
      children: <Widget>[
        if (icon != true) Icon(icon, size: 16, color: Colors.white),
        SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}

Widget AppIconButton({onPressed: Function, icon: IconData}) {
  return new MaterialButton(
    minWidth: 30,
    shape: CircleBorder(),
    onPressed: () {
      onPressed();
    },
    child: Icon(icon),
  );
}

class ExpansionPanelGenerator {
  final bool isExpanded;
  final String panelTitle;
  final Widget panelContent;

  ExpansionPanelGenerator(
      {this.isExpanded, this.panelTitle, this.panelContent});

  ExpansionPanel getPanel() {
    // TODO: implement build
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool bool) {
          return Container(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.input),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      panelTitle,
                      style: Theme.of(context).textTheme.title,
                    )
                  ],
                )
              ],
            ),
          );
        },
        body: Container(
          child: panelContent,
        ),
        isExpanded: isExpanded,
        canTapOnHeader: true);
  }
}

class AppBoxInput extends StatelessWidget {
  final String hint;
  final String helper;
  final Function onChange;
  final String label;

  AppBoxInput({this.hint, this.onChange, this.helper, this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              hintText: hint,
              helperText: helper,
              prefixIcon: Icon(Icons.chevron_right),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(0, 0)))),
        )
      ],
    );
  }
}

class AppSelectMenu extends StatelessWidget {
  final List<MapEntry<String, Widget>> items;

  final String label;
  AppSelectMenu({this.items, this.label});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButtonFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14),
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(0, 0)))),
      onChanged: (dynamic v) {
        print(v);
      },
      items: [
        for (MapEntry<String, Widget> i in items)
          DropdownMenuItem(
            value: i.key,
            child: i.value,
          )
      ],
    );
  }
}

Widget AppActionButton(BuildContext context, {String title, IconData icon}) {
  return RawMaterialButton(
    child: Container(
      child: RawMaterialButton(
        shape: StadiumBorder(),
        elevation: 2,
        fillColor: Colors.white,
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 12),
        onPressed: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              title,
            )
          ],
        ),
      ),
    ),
  );
}

Widget AppActionCard(BuildContext context, Widget child,
    {Color color, Function onTap}) {
  RoundedRectangleBorder shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.blue, width: .5),
      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)));
  return RawMaterialButton(
    elevation: 4,
    shape: shape,
    fillColor: color == null ? Colors.white : color,
    onPressed: onTap,
    child: Container(
      padding: EdgeInsets.all(16),
      child: child,
    ),
  );
}

Widget AppFlatActionCard(Widget child,
    {Function onTap,
    bool rounded,
    Color color,
    double elevation,
    EdgeInsets padding}) {
  return RawMaterialButton(
    elevation: 0,
    fillColor: color == null ? Colors.white : color,
    splashColor: Color.fromARGB(10, 200, 200, 200),
    onPressed: () {
      onTap();
    },
    child: Container(
      padding: padding == null ? EdgeInsets.all(16) : padding,
      child: child,
    ),
  );
}

Widget AppFlatInput(
    {Color color, IconData icon, String hint, Function onChange}) {
  return TextField(
    onChanged: onChange,
    onSubmitted: (String string) {},
    onEditingComplete: () {},
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon == null ? Icons.input : icon,
          color: color == null ? Colors.blue : color,
        ),
        helperText: "Category name",
        border: null,
        hintText: hint == null ? "Category label" : hint),
  );
}
