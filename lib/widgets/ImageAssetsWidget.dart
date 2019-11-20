import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker_modern/image_picker_modern.dart";

import "./AppWidgets.dart";
import "../data/restActions.dart";

class AssetsHandlerWidget extends StatefulWidget {
  final Function onSelected;

  AssetsHandlerWidget({this.onSelected});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AssetWidget(onSelected: this.onSelected);
  }
}

class _AssetWidget extends State<AssetsHandlerWidget> {
  bool uploading = false;
  final Function onSelected;
  _AssetWidget({this.onSelected});

  void selectFromGallery() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.uploading = true;
    });
    String imageURI;
    try {
      imageURI = await UploadActions().uploadImage(file);
      this.setState(() {
        uploading = false;
      });
      this.onSelected(imageURI);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  void selectFromCamera() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.uploading = true;
    });
    String imageURI;
    try {
      imageURI = await UploadActions().uploadImage(file);
      this.setState(() {
        uploading = false;
      });
      this.onSelected(imageURI);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  void selectFromAvailable() {}

  @override
  Widget build(BuildContext context) {
    Widget AssetsUploadLinkWidgets = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Quickly Select from your device",
          style: Theme.of(context).textTheme.subtitle.apply(color: Colors.red),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: AppPlainButton(
                label: "Camera",
                onClick: this.selectFromCamera,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: AppPlainButton(
                onClick: this.selectFromGallery,
                label: "Gallery",
              ),
            )
          ],
        )
      ],
    );

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          color: Colors.white,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: CircleBorder(),
                        child: Icon(Icons.clear),
                      ),
                    ),
                    Container(
                      child: Center(child: Text("Uploaded images")),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromRGBO(220, 225, 220, .9),
                padding: EdgeInsets.all(12),
                child: uploading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : AssetsUploadLinkWidgets,
              )
            ],
          ),
        ),
      ),
    );
  }
}
