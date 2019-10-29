import "dart:convert";

import "package:flutter/material.dart";

import "../data/models/ProductModel.dart";
import '../data/restActions.dart';

class ProductsViewRoute extends MaterialPageRoute {
  ProductsViewRoute()
      : super(builder: (BuildContext context) {
          return ProductStateful();
        });
}

class ProductStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductStateView();
  }
}

class _ProductStateView extends State<ProductStateful> {
  List<ProductModel> _items = new List<ProductModel>();

  bool isLoaded = false;
  _ProductStateView() {
    // load items
    ProductActions().getBucketItems().then((String responseString) {
      List<dynamic> list = json.decode(responseString);

      ProductListModel productList = ProductListModel(list);

      // set state
      setState(() {
        this._items.addAll(productList.items);
        isLoaded = true;
      });

      print(this._items.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void _onTap() {
      Navigator.pushNamed(context, "/product-view");
    }

    Widget productItem(ProductModel product) {
      return GestureDetector(
          onTap: _onTap,
          child: Container(
            margin: EdgeInsets.only(top: 16, left: 12, right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.lightBlue,
                    padding: EdgeInsets.only(
                        top: 12, bottom: 12, left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // product title
                              Text(
                                product.id,
                                style: Theme.of(context).textTheme.title,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              //Product category
                              Text(
                                product.description != null
                                    ? product.description
                                    : "",
                                style: Theme.of(context).textTheme.body1,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.category, color: Colors.black),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Shoes",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.playlist_add_check, color: Colors.black),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "50",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    }

    Widget loadingWidget() {
      return Scaffold(
        appBar: AppBar(title: Text("Products")),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    Widget listenings() {
      return Scaffold(
        backgroundColor: Color.fromRGBO(220, 220, 220, 10),
        appBar: AppBar(
          title: Text("Products"),
          actions: <Widget>[
            Icon(Icons.add),
            SizedBox(
              width: 16,
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
              productItem(_items[index])
          ],
        ),
      );
    }

    return isLoaded ? listenings() : loadingWidget();
  }
}
