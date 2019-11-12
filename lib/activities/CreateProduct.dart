import "dart:convert";

import 'package:flutter/material.dart';

import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

class CreateProductWidget extends MaterialPageRoute {
  final String id;
  CreateProductWidget({this.id})
      : super(builder: (BuildContext build) {
          return ProductEditor(
            id: id,
          );
        });
}

class ProductEditor extends StatefulWidget {
  final String id;
  ProductEditor({this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewProductState(id);
  }
}

class _NewProductState extends State<ProductEditor> {
  String id;
  _NewProductState(this.id);
  String title;
  String description;
  String image;
  String category;
  String caption;
  bool viewLoaded = false;
  bool sendingRequest = false;
  Map<String, dynamic> product;

  @override
  initState() {
    if (id != null) {
      ProductActions().getBucketItem(id).then((String itemResponse) {
        Map response = json.decode(itemResponse);
        setState(() {
          product = response['item'];
          title = product['title'];
          description = product['description'];
          caption = product['caption'];
        });

        setState(() {
          viewLoaded = true;
        });
      }).catchError((error) {
        print(error);
        viewLoaded = true;
      });
    } else {
      print("about to create a new product");
      viewLoaded = true;
    }
  }

  save() async {
    Map map = {"title": title, "description": description, "caption": caption};
    if (id == null) {
      setState(() {
        sendingRequest = true;
      });
      String response = await ProductActions().postToBucket(map);
      setState(() {
        sendingRequest = false;
      });
      if (response == null) {
        // something went wrong.
        return null;
      }
    } else {
      map.addAll({"_id": id});
      setState(() {
        sendingRequest = true;
      });
      bool check = await ProductActions().putInBucket(id, map);
      setState(() {
        sendingRequest = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget page1 = Container(
      margin: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
      child: ListView(
        children: <Widget>[
          AppSpacedCard(
              child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Basic Details",
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              AppPlainInputWidget(
                hint: "Product name",
                value: title,
                onSubmit: (String value) {
                  title = value;
                },
              ),
              SizedBox(
                height: 12,
              ),
              AppPlainInputWidget(
                hint: "Caption",
                value: caption,
                onSubmit: (String value) {
                  caption = value;
                },
              ),
              SizedBox(
                height: 12,
              ),
              AppPlainInputWidget(
                hint: "Description",
                value: "productivity",
                onSubmit: (String value) {
                  description = value;
                },
              )
            ],
          )),
          SizedBox(
            height: 12,
          ),
          AppImageUploaderButton(),
          SizedBox(
            height: 12,
          ),
          AppSpacedCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Stock",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: AppPlainInputWidget(hint: "Description"),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(child: AppPlainInputWidget(hint: "Description"))
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                AppPlainInputWidget(hint: "Description"),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Color.fromRGBO(0, 90, 0, .9),
          actions: <Widget>[
            RawMaterialButton(
              onPressed: () async {
                // showModalBottomSheet(context: null, builder: null);
                await save();
              },
              child: sendingRequest == true
                  ? Align(
                      child: CircularProgressIndicator(),
                    )
                  : Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
            ),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [PopupMenuItem(child: Text("Delete"))];
            })
          ],
          title: Text(
            "PRODUCT PAGEE",
            style: Theme.of(context).textTheme.title.apply(color: Colors.white),
          ),
        ),
        body: viewLoaded == true
            ? page1
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ));
  }
}
