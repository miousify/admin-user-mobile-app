import "package:flutter/material.dart";

import "./GenericBucketListings.dart";
import "./ProductEditor.dart";
import "../data/models/ProductModel.dart";
import "../data/restActions.dart";
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
  List<Map<String, String>> filter;

  @override
  Widget build(BuildContext context) {
    return AppPrimaryScaffold(
      title: "Products",
      actions: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          child: Icon(Icons.add),
          constraints: BoxConstraints.tightFor(width: 70),
        ),
        RawMaterialButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 14, bottom: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                                child: Image.asset("images/product.jpg"),
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Products filter",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                        Divider(
                          endIndent: 0,
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SwitchListTile(
                                value: true,
                                onChanged: (value) {},
                                title: Text("ASENDING"),
                              ),
                              Slider(
                                  label: "Start price",
                                  value: 100,
                                  min: 10,
                                  max: 100000,
                                  divisions: 10,
                                  onChanged: null),
                              PopupMenuButton(
                                itemBuilder: (BuildContext context) {},
                                child: ListTile(
                                  title: Text("LIST BY CATGEORY -"),
                                ),
                              ),
                              PopupMenuButton(
                                itemBuilder: (BuildContext context) {},
                                child: ListTile(
                                  title: Text("LIST BY BRAND"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          endIndent: 0,
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, bottom: 8),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: FlatButton(
                                onPressed: () {},
                                child: Text("Update list"),
                              ),
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.filter_list),
          constraints: BoxConstraints.tightFor(width: 70),
        ),
      ],
      body: ProductsListings(filter: ""),
    );
  }
}

class ProductsListings extends GenericList {
  final String filter;

  ProductsListings({this.filter})
      : super(action: new ProductActions(), filter: filter);

  @override
  Widget bucketItemsBuilder(List items) {
    // TODO: implement bucketItemsBuilder
    Iterable<Widget> itemsWidgetList =
        ProductListModel(items).items.map((ProductModel product) {
      return ProductItemWidget(
        product: product,
        key: Key(product.id),
      );
    });

    List<Widget> itemsList = itemsWidgetList.toList();

    // TODO: implement bucketItemsBuilder
    return Container(
      child: itemsList.length == 0
          ? Center(
              child: Column(),
            )
          : ListView(children: itemsList),
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;
  final Key key;
  ProductItemWidget({@required this.product, this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Card(
          child: RawMaterialButton(
        splashColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ProductEditor(
              id: product.id,
            );
          }));
        },
        child: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: product.image == null
                      ? Image.network(
                          "images/product.jpg",
                          fit: BoxFit.fill,
                        )
                      : Image.network(product.image),
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
                        product.title != null
                            ? product.title
                            : "Your product name",
                        style: TextStyle(
                          inherit: true,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        product.description != null
                            ? product.description
                            : "This is just a breif of the description for this product",
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
                  width: 8,
                ),
                PopupMenuButton(
                  onSelected: (value) {
                    switch (value) {
                      case "Delete":
                        print("Going to delete item");
                        break;
                    }
                  },
                  child: SizedBox(
                    width: 30,
                    child: Icon(Icons.more_vert),
                  ),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuItem>[
                      PopupMenuItem(
                        child: Text("View"),
                        value: "view",
                      ),
                      PopupMenuItem(
                        child: Text("Delete"),
                        value: "delete",
                      ),
                      PopupMenuItem(child: Text("Mute"))
                    ];
                  },
                )
              ],
            )),
      )),
    );
  }
}
