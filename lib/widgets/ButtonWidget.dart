import "dart:io";

import 'package:flutter/material.dart';
import "package:image_picker_modern/image_picker_modern.dart";

const BorderRadiusGeometry _BORDER_RADIUS_GEOMETERY =
    BorderRadius.all(Radius.elliptical(5, 5));

const RoundedRectangleBorder _SHAPE_BORDER =
    RoundedRectangleBorder(borderRadius: _BORDER_RADIUS_GEOMETERY);

class AppImageUploaderButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppImageUploaderState();
  }
}

class _AppImageUploaderState extends State<AppImageUploaderButton> {
  File imageFile;
  bool uploading;
  bool completed;
  Function onUploadFile;

  selectFile() async {
    setState(() {
      uploading = true;
    });
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    // upload file
    setState(() {
      imageFile = file;
      completed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(7, 7))),
        elevation: 2,
        padding: EdgeInsets.only(top: 14, bottom: 14),
        onPressed: selectFile,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.file_upload,
              color: Colors.white,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Upload Product image",
              style:
                  Theme.of(context).textTheme.button.apply(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class AppCardButton extends StatelessWidget {
  final String label;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color background;
  final Color color;
  final TextAlign textAlign;
  AppCardButton(
      {@required this.label,
      this.leadingIcon,
      this.trailingIcon,
      this.background,
      this.color,
      this.textAlign});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: this.background == null ? null : this.background,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Row(children: [
              Icon(
                null,
                color: this.color == null ? null : this.color,
              ),
              Text(
                this.label,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .apply(color: this.color == null ? null : this.color),
                textAlign: this.textAlign,
              )
            ]),
            Icon(
              null,
              color: this.color == null ? null : this.color,
            )
          ],
        ),
      ),
    );
  }
}

class AppPrimaryButton extends StatelessWidget {
  final String label;

  final Function onClick;
  AppPrimaryButton({this.label, this.onClick});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      elevation: 1,
      hoverElevation: 2,
      padding: EdgeInsets.all(12),
      onPressed: this.onClick,
      shape: _SHAPE_BORDER,
      child: Text(this.label,
          style: Theme.of(context).textTheme.button.apply(color: Colors.white)),
    );
  }
}

class AppSecondaryButton extends StatelessWidget {
  final String label;

  final Function onClick;

  AppSecondaryButton({this.onClick, this.label});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      padding: EdgeInsets.all(12),
      onPressed: this.onClick,
      shape: _SHAPE_BORDER,
      child: Text(this.label,
          style: Theme.of(context).textTheme.button.apply(color: Colors.white)),
    );
  }
}

class AppPlainButton extends StatelessWidget {
  final String label;
  final Function onClick;
  final bool withBackground;
  Color color = Color.fromRGBO(0, 50, 0, .9);
  AppPlainButton({this.onClick, this.label, this.withBackground = true});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      padding: EdgeInsets.all(12),
      onPressed: this.onClick,
      color: this.withBackground == true ? Colors.white : Colors.transparent,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: color),
          borderRadius: _BORDER_RADIUS_GEOMETERY),
      child: Text(this.label,
          style: Theme.of(context).textTheme.button.apply(color: color)),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  final String label;
  final Function onClick;

  AppOutlinedButton({this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      padding: EdgeInsets.all(12),
      onPressed: this.onClick,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: _BORDER_RADIUS_GEOMETERY),
      child: Text(this.label,
          style: Theme.of(context)
              .textTheme
              .button
              .apply(color: Color.fromRGBO(0, 50, 0, .9))),
    );
  }
}
