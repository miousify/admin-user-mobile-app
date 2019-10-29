import 'package:flutter/material.dart';

Widget AppImageUploaderButton() {
  return Container(
    child: RawMaterialButton(
      shape: StadiumBorder(),
      elevation: 2,
      fillColor: Colors.white,
      padding: EdgeInsets.only(top: 16, bottom: 16),
      onPressed: () {},
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
