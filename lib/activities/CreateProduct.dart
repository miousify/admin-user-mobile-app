import 'package:flutter/material.dart';

import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

class CreateProductWidget extends MaterialPageRoute {
  bool isNew;
  String id;
  CreateProductWidget({this.isNew, this.id})
      : super(builder: (BuildContext build) {
          return NewProduct();
        });
}

class NewProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewProductState();
  }
}

class _NewProductState extends State<NewProduct> {
  String _productTitle;
  String title;
  String description;
  String image;
  String category;
  String caption;
  String _productDescrption;
  int _currentPage = 0;
  bool _saveingProduct = false;
  bool _savedProduct = false;
  bool _isNew = true;
  String _productId = "";

  bool sendingRequest = false;

  _NewProductState() {}

  List<ExpansionPanel> expansionPanels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productTitle = "Product name";
    _productDescrption = "Product description goes here";
  }

  void _update() async {
    // updates a product
  }
  void _save() async {
    print("sent request");

    ProductActions productActions = new ProductActions();
    Map map = {
      "title": "title",
      "caption": "caption",
      "description": "description",
      "image": "image",
      "category": "category"
    };

    if (false == true) {
      dynamic response = await productActions.putInBucket(this._productId, map);
    } else {
      dynamic response = await productActions.postToBucket(map);
      print("successfully posted");
      print(response);
      // on added. load products page
    }
  }

  Widget page1() {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
      child: ListView(
        children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(16),
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
                  AppFlatInput(hint: "Product name"),
                  SizedBox(
                    height: 12,
                  ),
                  AppFlatInput(hint: "Caption"),
                  SizedBox(
                    height: 12,
                  ),
                  AppFlatInput(hint: "Description")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          AppImageUploaderButton(),
          SizedBox(
            height: 12,
          ),
          Card(
            borderOnForeground: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(16),
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
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14),
                              prefixIcon: Icon(
                                Icons.attach_money,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              hintText: "COST PRICE",
                              helperText: "Cost price",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14),
                              prefixIcon: Icon(Icons.attach_money,
                                  color: Theme.of(context).iconTheme.color),
                              hintText: "COST PRICE",
                              helperText: "Cost price",
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14),
                        prefixIcon: Icon(
                          Icons.view_comfy,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "Available products",
                        helperText: "Product availbel, e.g 10",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget page2() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBoxInput(
            hint: "Hint",
            label: "Label",
            helper: "Helper",
          ),
          SizedBox(
            height: 8,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
            child: Container(
              padding: EdgeInsets.all(8),
              height: 150,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Add Categories"),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          AppSelectMenu(label: "Categories", items: <MapEntry<String, Widget>>[
            MapEntry("Key", Text("View")),
            MapEntry("Key2", Text("View")),
            MapEntry("Ke3", Text("View"))
          ]),
          SizedBox(
            height: 12,
          ),
          AppSelectMenu(label: "Brand", items: <MapEntry<String, Widget>>[
            MapEntry("Key", Text("View")),
            MapEntry("Key2", Text("View")),
            MapEntry("Ke3", Text("View"))
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget currentView;
    switch (_currentPage) {
      case 0:
        currentView = page1();
        break;

      case 1:
        currentView = page2();
        break;
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              this.setState(() {
                _currentPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.input), title: Text("Basic")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group_work), title: Text("Classification")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text("Settings"))
            ]),
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Color.fromRGBO(0, 90, 0, .9),
          actions: <Widget>[
            RawMaterialButton(
              onPressed: () {
                _save();
              },
              child: Icon(
                Icons.save,
                color: Colors.white,
              ),
            )
          ],
          title: Text(
            _productTitle,
            style: Theme.of(context).textTheme.title.apply(color: Colors.white),
          ),
        ),
        bottomSheet: BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Container(
                color: Colors.purple,
                height: 0,
                child: LinearProgressIndicator(),
              );
            }),
        body: currentView);
  }
}
