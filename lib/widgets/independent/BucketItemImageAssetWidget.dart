import "dart:io";

import "package:flutter/material.dart";

import "../AppWidgets.dart";
import "../ImageAssetsWidget.dart";

class BucketItemImageAssetWidget extends StatefulWidget {
  final Function onUploadedPrimary;
  final Function onUploadedCover;
  final String primaryLink;
  final String coverLink;
  BucketItemImageAssetWidget(
      {this.primaryLink,
      this.onUploadedPrimary,
      this.onUploadedCover,
      this.coverLink});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AssetWidget(
        primaryLink: this.primaryLink,
        coverLink: this.coverLink,
        onUploadedCover: this.onUploadedCover,
        onUploadedPrimary: this.onUploadedPrimary);
  }
}

class _AssetWidget extends State<BucketItemImageAssetWidget> {
  File selectedCover;
  File selectedPrimary;

  final Function onUploadedPrimary;
  final Function onUploadedCover;
  String primaryLink;
  String coverLink;
  bool uploading = false;
  _AssetWidget(
      {this.selectedCover,
      this.coverLink,
      this.onUploadedCover,
      this.onUploadedPrimary,
      this.primaryLink});

  uploadStuff() {}

  @override
  Widget build(BuildContext context) {
    selectImageSourcePage() {
      showModalBottomSheet(context: null, builder: null);
    }

    Widget coverWidget = Container(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Colors.white,
            onPressed: () async {
              showModalBottomSheet(
                  elevation: 5,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return AssetsHandlerWidget(
                      onSelected: (link) {
                        this.onUploadedCover(link);
                        this.setState(() {
                          this.coverLink = link;
                          //this.assetClosed= true;
                        });
                      },
                    );
                  });
            },
            child: Text("Adverts photo"),
          ),
        ),
      ),
    );

    Widget primaryWidget = Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              showModalBottomSheet(
                  elevation: 5,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return AssetsHandlerWidget(
                      onSelected: (link) {
                        this.onUploadedPrimary(link);
                        this.setState(() {
                          this.primaryLink = link;
                          //this.assetClosed= true;
                        });
                      },
                    );
                  });
            },
            child: CircleAvatar(
              child: AppClipRound(
                child: Image.network(
                  this.primaryLink == null ? "" : this.primaryLink,
                ),
              ),
            ),
          ),
          Text(
            "Main image",
            style: Theme.of(context)
                .textTheme
                .caption
                .apply(backgroundColor: Colors.white),
          ),
          SizedBox(
            height: 24,
          )
        ],
      ),
    );
    // TODO: implement build
    return BeatifulContentPanel(
      margin: EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        child: Container(
          height: 180,
          child: Stack(
            children: <Widget>[
              Container(
                  color: Colors.red,
                  child: Image.network(
                    this.coverLink == null ? "" : this.coverLink,
                  )),
              coverWidget,
              primaryWidget,
              if (uploading == true) CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
