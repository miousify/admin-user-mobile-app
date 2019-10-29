import "dart:convert";

import "package:flutter/material.dart";

import "../data/models/CategoryModel.dart";
import "../data/restActions.dart";

class CategoriesViewRoute extends MaterialPageRoute {
  CategoriesViewRoute()
      : super(builder: (BuildContext context) {
          return CategoryStateful();
        });
}

class CategoryStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryStateView();
  }
}

class _CategoryStateView extends State<CategoryStateful> {
  bool isLoaded = false;

  List<CategoryModel> items = <CategoryModel>[];

  _CategoryStateView() {
    CategoryActions().getBucketItems().then((String response) {
      List<dynamic> list = json.decode(response);

      setState(() {
        items.addAll(CategoryListModel(list).items);
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget categoryItem() {
      return Container(
          margin: EdgeInsets.only(top: 16, left: 12, right: 12),
          child: Card(
              child: Container(
            height: 100,
            child: ListTile(
              title: Text("Category name"),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
              leading: Icon(Icons.threesixty),
            ),
          )));
    }

    Widget loadingView() {
      return Scaffold(
        appBar: AppBar(title: Text("Categories")),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    Widget loadedView() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          actions: <Widget>[
            Icon(Icons.add),
            SizedBox(
              width: 16,
            )
          ],
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: <Widget>[
            for (int index = 0; index < items.length; index++) categoryItem()
          ],
        ),
      );
    }

    // TODO: implement build
    return isLoaded == true ? loadedView() : loadingView();
  }
}
