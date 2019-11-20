import "package:flutter/material.dart";

import "./GenericBucketListings.dart";
import "../data/models/CategoryModel.dart";
import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

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
  @override
  Widget build(BuildContext context) {
    return AppPrimaryScaffold(
      title: "Categories",
      actions: <Widget>[
        RawMaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "/create-category");
          },
          child: Icon(Icons.add),
          constraints: BoxConstraints.tightFor(width: 70),
        )
      ],
      body: CategoryListingsWidget(),
    );
  }
}

class CategoryListingsWidget extends GenericList {
  CategoryListingsWidget() : super(action: CategoryActions(), filter: "");

  @override
  Widget bucketItemsBuilder(List items) {
    // TODO: implement bucketItemsBuilder
    Iterable<Widget> itemsWidgetList =
        CategoryListModel(items).items.map((CategoryModel product) {
      return Container(
        padding: EdgeInsets.all(12),
        child: Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            onTap: () {},
            leading: CircleAvatar(),
            title: Text("Category"),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
      );
    });

    List<Widget> itemsList = itemsWidgetList.toList();

    // TODO: implement bucketItemsBuilder
    return Container(
      child: itemsList.length == 0
          ? Center(
              child: Text("nothing to show"),
            )
          : Column(children: itemsList),
    );
  }
}
