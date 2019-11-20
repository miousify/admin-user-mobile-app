import "package:flutter/material.dart";

import "./GenericBucketListings.dart";
import "../data/models/CustomerModel.dart";
import "../data/restActions.dart";
import "../widgets/AppWidgets.dart";

class CustomersViewRoute extends MaterialPageRoute {
  CustomersViewRoute()
      : super(builder: (BuildContext context) {
          return View();
        });
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget customerItem() {
      return Container(
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(8),
              child: ListTile(
                  title: Text("Customer Name"),
                  subtitle: Row(
                    children: <Widget>[
                      Text("successful orders: "),
                      SizedBox(
                        width: 8,
                      ),
                      Text("pending order")
                    ],
                  ),
                  leading: CircleAvatar()),
            )),
      );
    }

    // TODO: implement build
    return AppPrimaryScaffold(
      title: "Customers",
      body: CustomerListings(),
    );
  }
}

class CustomerListings extends GenericList {
  CustomerListings() : super(filter: "", action: CustomerActions());
  @override
  Widget bucketItemsBuilder(List items) {
    // TODO: implement bucketItemsBuilder
    items.clear();
    print(items);

    Iterable<Widget> itemsWidgetList =
        CustomerListModel(items).items.map((CustomerModel customer) {
      return ListTile(
        title: Text("Customer"),
      );
    });

    List<Widget> itemsList = itemsWidgetList.toList();

    // TODO: implement bucketItemsBuilder
    return Container(
      child: itemsList.length == 0
          ? Center(
              child: Text("Customer not available at the moment"),
            )
          : Column(children: itemsList),
    );
  }
}
