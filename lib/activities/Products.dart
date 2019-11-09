import "dart:convert";

import "package:flutter/material.dart";

import "../data/models/ProductModel.dart";
import '../data/restActions.dart';
import "../widgets/AppWidgets.dart";

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
    return _ProductState();
  }
}

class _ProductState extends State<ProductStateful> {
  List<ProductModel> _items = new List<ProductModel>();
  bool isLoaded = false;
  List<Map<String, String>> filter;

  Future<bool> loadProducts() async {
    String rawProducts = await ProductActions().getBucketItems();
    //parse rawProducts to List;
    List<dynamic> list = json.decode(rawProducts);
    // convert to approprate list format
    ProductListModel productListModel = ProductListModel(list);
    setState(() {
      this._items.addAll(productListModel.items);
      isLoaded = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Widget listenings() {
      return AppPrimaryScaffold(
        title: "Products",
        actions: <Widget>[
          RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/create-product");
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 16,
          )
        ],
        body: ListView(
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
              ProductItemWidget(
                product: _items[index],
              )
          ],
        ),
      );
    }

    return FutureBuilder(
        future: loadProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return GenericLoadingWidget();
              break;
            case ConnectionState.waiting:
              return GenericLoadingWidget();
              break;
            case ConnectionState.active:
              return GenericLoadingWidget();
              break;
            case ConnectionState.done:
              return listenings();
              break;
          }

          return null;
        });
  }
}

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;

  ProductItemWidget({this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Card(
          child: RawMaterialButton(
        splashColor: Colors.blue,
        onPressed: () {},
        child: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.id,
                        style: TextStyle(
                          inherit: true,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "This is just a breif of the description for this product",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: <Widget>[],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            )),
      )),
    );
  }
}
