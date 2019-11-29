import "dart:convert";
import "dart:core";

import 'package:flutter/material.dart';

import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";
import "../widgets/independent/BucketItemImageAssetWidget.dart";

class ProductEditorRoute extends MaterialPageRoute {
  final String id;
  ProductEditorRoute({this.id})
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
  String category;
  String caption;
  double sellingPrice = 0.0;
  double costPrice = 0.0;
  String image;
  String cover;
  bool available = true;
  int quantity = 0;
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
          image = product['image'];
          available = product['available'];
          quantity = product['quantity'];
          costPrice = product['costPrice'];
          sellingPrice = product['sellingPrice'];
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

  onSelectCover(imageURI) {
    setState(() {
      cover = imageURI;
    });
  }

  onSelectPrimary(imageURI) {
    setState(() {
      image = imageURI;
    });
  }

  @override
  Widget build(BuildContext context) {
    save() async {
      Map<String, dynamic> map = {
        "title": title,
        "description": description,
        "caption": caption,
        "image": image,
        "available": available,
        "availability": true,
        "quantity": sellingPrice,
        "sellingPrice": sellingPrice,
        "costPrice": costPrice
      };

      print(map);

      if (id == null) {
        setState(() {
          sendingRequest = true;
        });

        print("sent");
        String response = await ProductActions().postToBucket(map);

        print("printing after post0");

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
          sendingRequest = false;
        });
      }
    }

    Widget $_BASIC_FORM = AppPlainFormWidget(
      formLabel: "Basics",
      inputElemtents: <Widget>[
        AppPlainInputWidget(
          hint: "Product name",
          value: title,
          onSubmit: (String value) {
            setState(() {
              title = value;
            });
          },
        ),
        AppPlainInputWidget(
          hint: "Caption",
          value: caption,
          onSubmit: (String value) {
            setState(() {
              caption = value;
            });
          },
        ),
        AppPlainInputWidget(
          hint: "Description",
          value: description,
          onChange: (String value) {
            description = value;
          },
        )
      ],
    );

    Widget classificationForm = AppPlainFormWidget(
      formLabel: "Stock",
      inputElemtents: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: AppPlainInputWidget(
                hint: "Cost price",
                isNumbered: true,
                value: costPrice == null ? "" : costPrice.toString(),
                onSubmit: (String value) {
                  setState(() {
                    costPrice = double.tryParse(value);
                  });
                },
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Expanded(
                child: AppPlainInputWidget(
                    hint: "Selling price",
                    isNumbered: true,
                    value: sellingPrice == null ? "" : sellingPrice.toString(),
                    onSubmit: (String value) {
                      print(value);
                      setState(() {
                        sellingPrice = double.tryParse(value);
                      });
                    }))
          ],
        ),
        AppPlainInputWidget(
            hint: "Quantity",
            isNumbered: true,
            value: quantity == null ? "" : quantity.toString(),
            onSubmit: (String value) {
              setState(() {
                print(value);
                quantity = int.tryParse(value);

                print("runtimet+ " + quantity.runtimeType.toString());
              });
            }),
        SwitchListTile(
          value: available == null ? true : available,
          onChanged: (v) {
            setState(() {
              available = v;
            });
          },
          title: Text("Availability"),
          subtitle: Text(
              "is this is not enable, product will not be seen by customers"),
        )
      ],
    );

    // TODO: implement build
    CustomScrollView testView = CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          actions: <Widget>[
            RawMaterialButton(
//              constraints: BoxConstraints.tightFor(),
              onPressed: () async {
                // showModalBottomSheet(context: null, builder: null);
                await save();
              },
              child: sendingRequest == true
                  ? Align(
                      child: CircularProgressIndicator(),
                    )
                  : Icon(Icons.save),
            ),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [PopupMenuItem(child: Text("Delete"))];
            })
          ],
          title: Text("Product page"),
          backgroundColor: Colors.white,
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Align(
                child: BucketItemImageAssetWidget(
                  onUploadedCover: this.onSelectCover,
                  onUploadedPrimary: this.onSelectPrimary,
                  coverLink: this.image,
                  primaryLink: this.image,
                ),
                alignment: Alignment.bottomCenter,
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                child: Container(
              child: $_BASIC_FORM,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            )),
            Container(
                child: Container(
              child: classificationForm,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            ))
          ]),
        ),
      ],
      scrollDirection: Axis.vertical,
    );

    Scaffold main = Scaffold(
        body: viewLoaded == true
            ? testView
            : Center(
                child: CircleAvatar(),
              ));

    return main;
  }
}
