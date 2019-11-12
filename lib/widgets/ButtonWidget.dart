import "dart:io";

import 'package:flutter/material.dart';
import "package:image_picker_modern/image_picker_modern.dart";

class AppImageUploaderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RawMaterialButton(
        shape: StadiumBorder(),
        elevation: 2,
        fillColor: Colors.white,
        padding: EdgeInsets.only(top: 16, bottom: 16),
        onPressed: () async {
          File file = await ImagePicker.pickImage(source: ImageSource.gallery);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.file_upload,
              color: Colors.blue,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Upload IMAGE",
            )
          ],
        ),
      ),
    );
  }
}
